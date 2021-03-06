# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-perl/Goo-Canvas/Goo-Canvas-0.06.ebuild,v 1.4 2010/05/16 20:16:58 hwoarang Exp $

EAPI=2

MODULE_AUTHOR=YEWENBIN
inherit perl-module

DESCRIPTION="Perl interface to the GooCanvas"

SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

RDEPEND="x11-libs/goocanvas
	dev-perl/gtk2-perl
	dev-perl/glib-perl
	dev-perl/Cairo"
DEPEND="${RDEPEND}
	dev-perl/extutils-depends
	dev-perl/extutils-pkgconfig"

PATCHES=(
	# this patch fixes segfaults on amd64 platforms
	"${FILESDIR}"/fix_implicit_pointer_declaration.patch
)
