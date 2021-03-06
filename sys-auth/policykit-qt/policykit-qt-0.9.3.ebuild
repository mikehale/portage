# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/sys-auth/policykit-qt/policykit-qt-0.9.3.ebuild,v 1.2 2010/05/15 13:46:31 reavertm Exp $

EAPI="2"

inherit cmake-utils

MY_P="polkit-qt-${PV}"

DESCRIPTION="PolicyKit Qt4 API wrapper library."
HOMEPAGE="http://kde.org/"
SRC_URI="mirror://kde/stable/apps/KDE4.x/admin/${MY_P}.tar.bz2"

LICENSE="LGPL-2"
KEYWORDS="~alpha ~amd64 ~arm ~hppa ~ia64 ~ppc ~ppc64 ~sparc ~x86"
SLOT="0"
IUSE="debug examples"

RDEPEND="
	>=sys-auth/policykit-0.8
	>=x11-libs/qt-gui-4.4:4[dbus]
"
DEPEND="${RDEPEND}
	dev-util/automoc
"

S="${WORKDIR}/${MY_P}"

src_configure() {
	mycmakeargs="${mycmakeargs}
		$(cmake-utils_use_build examples)"

	cmake-utils_src_configure
}
