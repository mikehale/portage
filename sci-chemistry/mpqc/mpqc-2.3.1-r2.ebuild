# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/sci-chemistry/mpqc/mpqc-2.3.1-r2.ebuild,v 1.2 2010/06/21 13:32:33 jlec Exp $

EAPI=2

inherit autotools eutils fortran toolchain-funcs

DESCRIPTION="The Massively Parallel Quantum Chemistry Program"
HOMEPAGE="http://www.mpqc.org/"
SRC_URI="mirror://sourceforge/mpqc/${P}.tar.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~ppc64 ~x86"
IUSE="doc mpi threads tk"

RDEPEND="
	virtual/blas
	virtual/lapack
	mpi? ( virtual/mpi[cxx] )
	tk? ( dev-lang/tk )"
DEPEND="${RDEPEND}
	dev-lang/perl
	sys-devel/flex
	>=sys-apps/sed-4
	doc? ( app-doc/doxygen
		media-gfx/graphviz )"

src_prepare() {
	epatch "${FILESDIR}/${P}-as-needed.patch"
	epatch "${FILESDIR}/${P}-respect-ldflags.patch"
	# it's a nasty workaround rather than patch
	epatch "${FILESDIR}/${P}-test-failure-hack.patch"
	# do not install tkmolrender if not requested
	if ! use tk; then
		sed -e "s:.*/bin/molrender/tkmolrender.*::" \
			-e "s:.*\$(INSTALLBINOPT) tkmolrender.*::" \
			-e "s:/bin/rm -f tkmolrender::" \
			-i "./src/bin/molrender/Makefile" \
			|| die "failed to disable tkmolrender"
	fi
	eautoreconf
}

src_configure() {
	tc-export CC
	tc-export CXX
	if use mpi; then
		export CC=mpicc
		export CXX=mpicxx
	fi
	econf \
		$(use_enable threads) \
		$(use_enable mpi parallel) \
		--enable-shared \
		${myconf}

	sed -i -e "s:^CFLAGS =.*$:CFLAGS=${CFLAGS}:" \
		-e "s:^FFLAGS =.*$:FFLAGS=${FFLAGS:- -O2}:" \
		-e "s:^CXXFLAGS =.*$:CXXFLAGS=${CXXFLAGS}:" \
		lib/LocalMakefile
}

src_test() {
	cd "${S}"/src/bin/mpqc/validate

	# we'll only run the small test set, since the
	# medium and large ones take >10h and >24h on my
	# 1.8Ghz P4M
	make check0 || die "failed in test routines"
}

src_install() {
	emake installroot="${D}" install install_devel install_inc \
		|| die "install failed"

	dodoc CHANGES CITATION README || die "failed to install docs"

	# make extended docs
	if use doc; then
		cd "${S}"/doc
		make all || die "failed to generate documentation"
		doman man/man1/* && doman man/man3/* || \
			die "failed to install man pages"
		dohtml -r html/
	fi
}

pkg_postinst() {
	echo
	einfo "MPQC can be picky with regard to compilation flags."
	einfo "If during mpqc runs you have trouble converging or "
	einfo "experience oscillations during SCF interations, "
	einfo "consider recompiling with less aggressive CFLAGS/CXXFLAGS."
	einfo "Particularly, replacing -march=pentium4 by -march=pentium3"
	einfo "might help if you encounter problems with correlation "
	einfo "consistent basis sets."
	echo
}
