# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/xfce-extra/thunar-media-tags-plugin/thunar-media-tags-plugin-0.1.2-r1.ebuild,v 1.1 2010/01/15 04:42:58 ssuominen Exp $

EAPI=2
EAUTORECONF=yes
inherit xfconf

DESCRIPTION="Thunar media tags plugin"
HOMEPAGE="http://www.xfce.org/"
SRC_URI="mirror://xfce/src/thunar-plugins/${PN}/0.1/${P}.tar.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~alpha ~amd64 ~arm ~hppa ~ia64 ~ppc ~ppc64 ~sparc ~x86 ~x86-fbsd ~x86-freebsd ~amd64-linux ~ia64-linux ~x86-linux"
IUSE="debug"

RDEPEND=">=xfce-base/exo-0.5.1
	>=xfce-base/thunar-1.1.0
	>=media-libs/taglib-1.4"
DEPEND="${RDEPEND}
	dev-util/pkgconfig"

pkg_setup() {
	DOCS="AUTHORS ChangeLog README TODO"
	XFCONF="--disable-dependency-tracking
		$(use_enable debug)"
	PATCHES=( "${FILESDIR}/${P}-exo_and_thunarx.patch" )
}
