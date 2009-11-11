# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-perl/File-Which/File-Which-1.09.ebuild,v 1.1 2009/11/10 10:17:13 robbat2 Exp $

EAPI=2

MODULE_AUTHOR=ADAMK
inherit perl-module

DESCRIPTION="Perl module implementing 'which' internally"

SLOT="0"
KEYWORDS="~alpha ~amd64 ~arm ~hppa ~ia64 ~ppc ~ppc64 ~s390 ~sh ~sparc ~x86"
IUSE="test"

RDEPEND=""
DEPEND="test? ( dev-perl/Test-Script )"

SRC_TEST="do"
mydoc="TODO"
