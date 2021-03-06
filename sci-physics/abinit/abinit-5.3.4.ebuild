# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/sci-physics/abinit/abinit-5.3.4.ebuild,v 1.1 2007/05/09 06:47:17 dberkholz Exp $

inherit fortran toolchain-funcs

DESCRIPTION="Find total energy, charge density and electronic structure using density functional theory"
HOMEPAGE="http://www.abinit.org/"
SRC_URI="ftp://ftp.abinit.org/pub/abinitio/ABINIT_v${PV}/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~ppc ~x86"
#IUSE="mpi netcdf test"
IUSE="mpi test"

RDEPEND="virtual/blas
	virtual/lapack"
# Doesn't build with 4.1-20060210
#	netcdf? ( sci-libs/netcdf )
DEPEND="${RDEPEND}"

# F90 code, g77 won't work
FORTRAN="gfortran ifc"

pkg_setup() {
	fortran_pkg_setup

	# Doesn't compile with gcc-4.0, only >=4.1
	local diemsg="Requires gcc-4.1 or newer"
	if [[ "${FORTRANC}" = "gfortran" ]]; then
		if [[ $(gcc-major-version) -eq 4 ]] \
			&& [[ $(gcc-minor-version) -lt 1  ]]; then
				die "${diemsg}"
		fi
	fi
}

src_unpack() {
	unpack ${A}
	cd "${S}"
	epatch "${FILESDIR}"/${PV}-change-default-directories.patch
	epatch "${FILESDIR}"/5.2.3-fix-64bit-detection.patch

	# Yea for breaking compatibility with no ChangeLog entry in 2.60
	if has_version '>=sys-devel/autoconf-2.60'; then
		sed -i -e "s:_AC_SRCPATHS:_AC_SRCDIRS:g" config/m4/init.m4
	fi

	AT_M4DIR="config/m4" eautoreconf
}

src_compile() {
	econf \
		--with-install-type=debian \
		--disable-config-file \
		--disable-library-search \
		$(use_enable mpi) \
		--with-blas-prefix=/usr \
		--with-lapack-prefix=/usr \
		--with-c-optflags="${CFLAGS}" \
		--with-fortran-optflags="${FFLAGS}" \
		--with-fortran-ldflags='-lpthread' \
		FC="${FORTRANC}" \
		CC="$(tc-getCC)" \
		|| die "configure failed"
#		$(use_enable netcdf) \

	emake || die "make failed"
}

src_test() {
	einfo "The tests take quite a while, on the order of 2-3 hours"
	einfo "on a dual Athlon 2000+."
	cd "${S}"/tests
	emake tests_dev

	local REPORT
	for REPORT in $(find . -name *fl*); do
		elog "Results for ${REPORT%%/*} tests"
		while read line; do
			elog "${line}"
		done \
			< <(cat ${REPORT} )
	done
}

src_install() {
	emake DESTDIR="${D}" install || die "install failed"

	if use test; then
		dodoc tests/summary_tests.tar.gz
	fi

	dodoc KNOWN_PROBLEMS README
}

pkg_postinst() {
	if use test; then
		elog "The test results will be installed as summary_tests.tar.gz."
	fi
}
