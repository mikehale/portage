# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/x11-apps/x11perf/x11perf-1.5.1.ebuild,v 1.9 2010/01/19 18:17:34 armin76 Exp $

inherit x-modular

DESCRIPTION="X rendering operation stress test utility"

KEYWORDS="alpha amd64 arm hppa ia64 ~mips ppc ppc64 s390 sh sparc x86 ~x86-fbsd"
IUSE=""

RDEPEND="x11-libs/libX11
	x11-libs/libXmu
	x11-libs/libXft
	x11-libs/libXrender
	x11-libs/libXext"
DEPEND="${RDEPEND}"
