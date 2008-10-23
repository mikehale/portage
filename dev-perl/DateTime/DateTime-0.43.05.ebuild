# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-perl/DateTime/DateTime-0.43.05.ebuild,v 1.1 2008/10/05 13:46:58 tove Exp $

inherit versionator
MY_P=${PN}-$(delete_version_separator 2)
MODULE_AUTHOR=DROLSKY
S=${WORKDIR}/${MY_P}
inherit perl-module

DESCRIPTION="A date and time object"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~alpha ~amd64 ~ia64 ~ppc ~ppc64 ~sparc ~x86 ~x86-fbsd"
IUSE=""

SRC_TEST="do"

DEPEND=">=dev-perl/Params-Validate-0.76
	>=virtual/perl-Time-Local-1.04
	>=dev-perl/DateTime-TimeZone-0.59
	>=dev-perl/DateTime-Locale-0.41
	dev-lang/perl"