# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-perl/Locale-PO/Locale-PO-0.21.ebuild,v 1.1 2008/09/09 09:20:41 tove Exp $

MODULE_AUTHOR=KEN
inherit perl-module

DESCRIPTION="Object-oriented interface to gettext po-file entries"

LICENSE="|| ( Artistic GPL-2 )"
SLOT="0"
KEYWORDS="~alpha ~amd64 ~hppa ~ia64 ~ppc ~ppc64 ~sparc ~x86"
IUSE=""

DEPEND="sys-devel/gettext
	dev-perl/File-Slurp
	dev-lang/perl"

SRC_TEST="do"