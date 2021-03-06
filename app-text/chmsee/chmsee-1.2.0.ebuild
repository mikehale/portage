# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/app-text/chmsee/chmsee-1.2.0.ebuild,v 1.1 2010/08/14 03:16:14 dirtyepic Exp $

EAPI="3"

inherit cmake-utils

DESCRIPTION="Gecko-based HTML Help (chm) viewer"
HOMEPAGE="http://chmsee.googlecode.com"
SRC_URI="http://chmsee.googlecode.com/files/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND=">=dev-libs/glib-2.24:2
	dev-libs/libxml2
	>=x11-libs/gtk+-2.20:2
	dev-libs/chmlib
	dev-libs/libgcrypt
	>=net-libs/xulrunner-1.9.2"
DEPEND="${RDEPEND}
	sys-devel/gettext
	>=dev-util/intltool-0.37"

DOCS="NEWS README AUTHORS ChangeLog"
