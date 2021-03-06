# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/x11-libs/libX11/libX11-1.3.3.ebuild,v 1.10 2010/08/02 18:03:30 armin76 Exp $

EAPI="1"

inherit x-modular toolchain-funcs flag-o-matic

DESCRIPTION="X.Org X11 library"

KEYWORDS="alpha amd64 arm hppa ia64 ~mips ppc ppc64 s390 sh sparc x86 ~x86-fbsd"
IUSE="doc ipv6 test +xcb"

RDEPEND=">=x11-libs/xtrans-1.2.3
	x11-proto/kbproto
	>=x11-proto/xproto-7.0.13
	xcb? ( >=x11-libs/libxcb-1.1.92 )
	!xcb? (
		x11-libs/libXau
		x11-libs/libXdmcp
	)"
DEPEND="${RDEPEND}
	doc? (
		app-text/ghostscript-gpl
		sys-apps/groff
	)
	x11-proto/xf86bigfontproto
	!xcb? (
		x11-proto/bigreqsproto
		x11-proto/xcmiscproto
	)
	test? ( dev-lang/perl )
	x11-proto/inputproto
	x11-proto/xextproto"

pkg_setup() {
	CONFIGURE_OPTIONS="$(use_enable doc specs) $(use_enable ipv6)
		$(use_with xcb)"
	# xorg really doesn't like xlocale disabled.
	# $(use_enable nls xlocale)
}

src_compile() {
	x-modular_src_configure
	# [Cross-Compile Love] Disable {C,LD}FLAGS and redefine CC= for 'makekeys'
	( filter-flags -m* ; cd src/util && make CC=$(tc-getBUILD_CC) CFLAGS="${CFLAGS}" LDFLAGS="" clean all)
	x-modular_src_make
}
