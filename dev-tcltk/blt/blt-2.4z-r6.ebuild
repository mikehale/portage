# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-tcltk/blt/blt-2.4z-r6.ebuild,v 1.1 2010/03/06 12:16:07 jlec Exp $

EAPI="3"

inherit eutils flag-o-matic toolchain-funcs

MY_V_SUFFIX="-8.5.2"
HOMEPAGE="http://blt.sourceforge.net/
http://jos.decoster.googlepages.com/bltfortk8.5.2"
SRC_URI="http://jos.decoster.googlepages.com/${PN}${PV}${MY_V_SUFFIX}.tar.gz"
DESCRIPTION="BLT is an extension to the Tk toolkit adding new widgets, geometry managers, and misc commands."

IUSE="jpeg X"
SLOT="0"
LICENSE="BSD"
KEYWORDS="~amd64 ~ppc ~ppc64 ~sparc ~x86 ~amd64-linux ~x86-linux"

DEPEND="
	>=dev-lang/tk-8.0
	jpeg? ( media-libs/jpeg:0 )
	X? ( x11-libs/libX11 )"
RDEPEND="${DEPEND}"

S="${WORKDIR}/${PN}${PV}${MY_V_SUFFIX}"

src_prepare() {
	epatch "${FILESDIR}/blt-2.4z-r4-fix-makefile.patch"
	epatch "${FILESDIR}/blt-2.4z-r4-fix-makefile2.patch"
	# From blt-2.4z-6mdk.src.rpm
	epatch "${FILESDIR}"/blt2.4z-64bit.patch

	#epatch "${FILESDIR}"/blt-2.4z-tcl8.5-fix.patch
	epatch "${FILESDIR}"/blt-2.4z-tcl8.5-fixpkgruntime.patch

	epatch "${FILESDIR}"/${P}-ldflags.patch

	# Set the correct libdir
	sed -i -e "s:\(^libdir=\${exec_prefix}/\)lib:\1$(get_libdir):" \
		configure* || die "sed configure* failed"
	sed -i -e "/^scriptdir =/s:lib:$(get_libdir):" \
		Makefile.in demos/Makefile.in || die "sed Makefile.in failed"
}

src_configure() {
	# bug 167934
	append-flags -fPIC

	econf \
		--x-includes="${EPREFIX}"/usr/include \
		--x-libraries="${EPREFIX}"/usr/$(get_libdir) \
		--with-blt="${EPREFIX}"/usr/$(get_libdir) \
		--with-tcl="${EPREFIX}"/usr/$(get_libdir) \
		--with-tk="${EPREFIX}"/usr/$(get_libdir) \
		--with-tclincls="${EPREFIX}"/usr/include \
		--with-tkincls="${EPREFIX}"/usr/include \
		--with-tcllibs="${EPREFIX}"/usr/$(get_libdir) \
		--with-tklibs="${EPREFIX}"/usr/$(get_libdir) \
		--with-cc="$(tc-getCC)" \
		--with-cflags="${CFLAGS}" \
		$(use_enable jpeg) \
		$(use_with X x) \
		|| die "./configure failed"

}

src_compile() {
	# parallel borks
	emake -j1 LDFLAGS="${LDFLAGS}" || die "emake failed"
}

src_install() {
	sed \
		-e "s:../src/bltwish:${EPREFIX}/usr/bin/bltwish:g" \
		-e "s:../bltwish:${EPREFIX}/usr/bin/bltwish:g" \
		-e "s:/usr/local/bin/bltwish:${EPREFIX}/usr/bin/bltwish:g" \
		-e "s:/usr/local/bin/tclsh:${EPREFIX}/usr/bin/tclsh:g" \
		-i demos/{,scripts/}*.tcl || die

	dodir /usr/bin \
		/usr/$(get_libdir)/blt2.4/demos/bitmaps \
		/usr/share/man/mann \
		/usr/include \
			|| die "dodir failed"
	emake -j1 INSTALL_ROOT="${D}" install || die "make install failed"

	dodoc NEWS PROBLEMS README
	dohtml html/*.html
	for f in `ls "${ED}"/usr/share/man/mann` ; do
		mv "${ED}"/usr/share/man/mann/${f} "${ED}"/usr/share/man/mann/${f/.n/.nblt}
	done

	# bug 259338 - dev-tcltk/blt-2.4z-r4 provides empty pkgIndex.tcl
	cp "${FILESDIR}"/pkgIndex.tcl "${ED}"/usr/$(get_libdir)/blt2.4/pkgIndex.tcl
}
