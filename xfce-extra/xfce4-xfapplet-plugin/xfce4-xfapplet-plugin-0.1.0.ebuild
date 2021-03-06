# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/xfce-extra/xfce4-xfapplet-plugin/xfce4-xfapplet-plugin-0.1.0.ebuild,v 1.3 2010/07/19 23:46:18 jer Exp $

EAPI=2
inherit xfconf

DESCRIPTION="Panel plugin to support GNOME applets"
HOMEPAGE="http://www.xfce.org/"
SRC_URI="mirror://xfce/src/panel-plugins/${PN}/0.1/${P}.tar.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="alpha amd64 arm ia64 ppc ppc64 sparc x86"
IUSE="debug"

RDEPEND=">=x11-libs/gtk+-2.4:2
	>=xfce-base/xfce4-panel-4.3.20
	>=gnome-base/orbit-2.12.5
	>=gnome-base/gnome-panel-2"
DEPEND="${RDEPEND}
	dev-util/pkgconfig
	dev-util/intltool"

pkg_setup() {
	DOCS="AUTHORS ChangeLog NEWS README"
	XFCONF="--disable-dependency-tracking
		$(use_enable debug)"
}
