# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/xfce-base/garcon/garcon-0.1.1.ebuild,v 1.2 2010/03/31 12:05:15 ssuominen Exp $

EAPI=3
inherit xfconf

DESCRIPTION="a freedesktop.org compliant menu implementation based on GLib and GIO"
HOMEPAGE="http://www.xfce.org/"
SRC_URI="mirror://xfce/src/libs/${PN}/0.1/${P}.tar.bz2"

LICENSE="LGPL-2 FDL-1.1"
SLOT="0"
KEYWORDS="~alpha ~amd64 ~arm ~hppa ~ia64 ~ppc ~ppc64 ~sh ~sparc ~x86 ~x86-fbsd"
IUSE="debug"

RDEPEND=">=dev-libs/glib-2.14:2
	>=x11-libs/gtk+-2.12:2"
DEPEND="${RDEPEND}
	dev-util/pkgconfig
	dev-util/intltool
	sys-devel/gettext"

pkg_setup() {
	XFCONF="--disable-dependency-tracking
		--disable-static
		$(xfconf_use_debug)
		--with-html-dir=${EPREFIX}/usr/share/doc/${PF}/html"
	DOCS="AUTHORS ChangeLog HACKING NEWS README STATUS TODO"
}
