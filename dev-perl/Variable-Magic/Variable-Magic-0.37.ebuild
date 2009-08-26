# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-perl/Variable-Magic/Variable-Magic-0.37.ebuild,v 1.1 2009/08/25 19:06:22 robbat2 Exp $

EAPI=2

MODULE_AUTHOR=VPIT
inherit perl-module

DESCRIPTION="Associate user-defined magic to variables from Perl"

SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

RDEPEND=""
DEPEND="${RDEPEND}
	test? ( dev-perl/Test-Pod
		dev-perl/Test-Pod-Coverage )"

SRC_TEST=do
