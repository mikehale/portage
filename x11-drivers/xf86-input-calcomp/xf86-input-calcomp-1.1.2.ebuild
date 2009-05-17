# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/x11-drivers/xf86-input-calcomp/xf86-input-calcomp-1.1.2.ebuild,v 1.7 2009/05/15 16:07:04 armin76 Exp $

# Must be before x-modular eclass is inherited
#SNAPSHOT="yes"
XDPVER="4"

inherit x-modular

DESCRIPTION="Calcomp input driver"
KEYWORDS="~alpha amd64 arm hppa ia64 ~ppc ~ppc64 sh sparc x86 ~x86-fbsd"
RDEPEND=">=x11-base/xorg-server-1.0.99"
DEPEND="${RDEPEND}
	>=x11-proto/inputproto-1.4.1
	x11-proto/randrproto
	x11-proto/xproto"
