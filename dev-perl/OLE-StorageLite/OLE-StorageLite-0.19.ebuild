# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-perl/OLE-StorageLite/OLE-StorageLite-0.19.ebuild,v 1.4 2010/06/27 19:15:48 nixnut Exp $

MODULE_AUTHOR=JMCNAMARA
MY_PN=OLE-Storage_Lite
MY_P=${MY_PN}-${PV}
S=${WORKDIR}/${MY_P}
inherit perl-module

DESCRIPTION="Simple Class for OLE document interface."
LICENSE="|| ( Artistic GPL-2 )"
SLOT="0"
KEYWORDS="amd64 ia64 ppc sparc x86"
IUSE=""

DEPEND="dev-lang/perl"

SRC_TEST="do"
