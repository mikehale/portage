# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/perl-core/Pod-Simple/Pod-Simple-3.07.ebuild,v 1.9 2010/01/05 19:15:50 nixnut Exp $

MODULE_AUTHOR=ARANDAL
inherit perl-module

DESCRIPTION="framework for parsing Pod"

LICENSE="|| ( Artistic GPL-2 )"
SLOT="0"
KEYWORDS="alpha amd64 arm hppa ia64 ~mips ppc ppc64 s390 sh sparc x86 ~sparc-fbsd ~x86-fbsd ~x86-freebsd ~amd64-linux ~ia64-linux ~x86-linux ~x86-macos"
IUSE=""

DEPEND=">=virtual/perl-Pod-Escapes-1.04
	dev-lang/perl"

SRC_TEST="do"
