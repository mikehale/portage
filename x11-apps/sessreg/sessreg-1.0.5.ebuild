# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/x11-apps/sessreg/sessreg-1.0.5.ebuild,v 1.9 2010/01/19 18:16:15 armin76 Exp $

inherit x-modular

DESCRIPTION="manage utmp/wtmp entries for non-init clients"

KEYWORDS="alpha amd64 arm hppa ia64 ~mips ppc ppc64 s390 sh sparc x86 ~x86-fbsd"
IUSE=""

RDEPEND=""
DEPEND="${RDEPEND}
	x11-proto/xproto"
