# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/x11-themes/xcursor-themes/xcursor-themes-1.0.2.ebuild,v 1.9 2010/02/24 14:08:53 ssuominen Exp $

# Must be before x-modular eclass is inherited
# SNAPSHOT="yes"

MODULE="data"
inherit x-modular

DESCRIPTION="X.Org cursor themes: whiteglass, redglass and handhelds"
KEYWORDS="alpha amd64 arm hppa ia64 ~mips ppc ppc64 sh sparc x86 ~x86-fbsd"
IUSE=""

RDEPEND="
	media-libs/libpng
	x11-libs/libX11
	x11-libs/libXcursor
"
DEPEND="${RDEPEND}
	x11-apps/xcursorgen"
