# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/x11-themes/xcursor-neutral/xcursor-neutral-1.20.ebuild,v 1.6 2010/03/11 00:25:50 ssuominen Exp $

MY_P="48837-Neutral_Plus_1.2.tar.bz2"
MY_PN="Neutral_Plus"

DESCRIPTION="\"Neutral_Plus\", the standard X.Org mouse cursor with shadows and animations."
HOMEPAGE="http://kde-look.org/content/show.php/show.php?content=48837"
SRC_URI="http://kde-look.org/CONTENT/content-files/${MY_P}"

LICENSE="Artistic-2"
SLOT="0"
KEYWORDS="amd64 sparc x86 ~x86-fbsd"
IUSE="examples"
RDEPEND="x11-libs/libX11
	x11-libs/libXcursor
	>=media-libs/libpng-1.2"
DEPEND="${RDEPEND}
	x11-apps/xcursorgen"
S="${WORKDIR}/Neutral_Plus"

src_install(){
	insinto /usr/share/cursors/xorg-x11/${MY_PN}/

	doins -r "${S}"/cursors/
	doins "${S}"/index.theme

	## install additional cursor source files?
	if use examples; then
	    doins -r "${S}"/source/
	fi
}
