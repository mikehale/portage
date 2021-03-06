# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/gnome-extra/hardware-monitor/hardware-monitor-1.4.2.ebuild,v 1.3 2009/07/21 20:17:09 mrpouet Exp $

GCONF_DEBUG="no"

inherit gnome2

DESCRIPTION="Gnome2 Hardware Monitor Applet"
HOMEPAGE="http://people.iola.dk/olau/hardware-monitor/"
SRC_URI="http://people.iola.dk/olau/hardware-monitor/source/${P}.tar.bz2"
LICENSE="GPL-2"

SLOT="0"
KEYWORDS="~amd64 ~ppc ~sparc ~x86"
IUSE="lm_sensors"

RDEPEND=">=dev-cpp/gconfmm-2.6.0
		>=dev-cpp/gtkmm-2.6.0
		>=dev-cpp/libgnomecanvasmm-2.6.0
		>=dev-cpp/libglademm-2.6.0
		>=gnome-base/gnome-panel-2
		>=gnome-base/libgnomeui-2.20.1
		>=gnome-base/libgtop-2.6.0
		lm_sensors? ( >=sys-apps/lm_sensors-3 )"
DEPEND="${RDEPEND}
		dev-util/pkgconfig
		>=dev-util/intltool-0.29"

DOCS="AUTHORS ChangeLog NEWS"

pkg_setup() {
	G2CONF="${G2CONF} \
			$(use_with lm_sensors libsensors)"

}
