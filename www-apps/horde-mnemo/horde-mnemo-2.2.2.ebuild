# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/www-apps/horde-mnemo/horde-mnemo-2.2.2.ebuild,v 1.1 2009/09/17 17:20:25 a3li Exp $

HORDE_PHP_FEATURES="-o mysql mysqli odbc postgres ldap"
HORDE_MAJ="-h3"
inherit horde

DESCRIPTION="Mnemo is the Horde note manager"

KEYWORDS="~alpha ~amd64 ~hppa ~ppc ~sparc ~x86"

DEPEND=""
RDEPEND=">=www-apps/horde-3"
