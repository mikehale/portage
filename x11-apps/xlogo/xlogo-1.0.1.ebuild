# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/x11-apps/xlogo/xlogo-1.0.1.ebuild,v 1.9 2009/08/25 15:15:10 remi Exp $

# Must be before x-modular eclass is inherited
#SNAPSHOT="yes"

inherit x-modular

DESCRIPTION="X Window System logo"

KEYWORDS="alpha amd64 arm hppa ia64 mips ppc ppc64 s390 sh sparc x86"
IUSE=""
RDEPEND="x11-libs/libXrender
	x11-libs/libXft
	x11-libs/libXaw"
DEPEND="${RDEPEND}"
CONFIGURE_OPTIONS="--with-render --disable-xprint"
