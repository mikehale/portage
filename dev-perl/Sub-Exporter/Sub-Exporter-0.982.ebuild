# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-perl/Sub-Exporter/Sub-Exporter-0.982.ebuild,v 1.4 2010/06/27 16:30:38 nixnut Exp $

MODULE_AUTHOR=RJBS
inherit perl-module

DESCRIPTION="A sophisticated exporter for custom-built routines"

LICENSE="|| ( Artistic GPL-2 )"
SLOT="0"
KEYWORDS="amd64 ppc x86"
IUSE=""

DEPEND="dev-lang/perl
	>=dev-perl/Sub-Install-0.92
	>=dev-perl/Data-OptList-0.100
	>=dev-perl/Params-Util-0.14"

SRC_TEST=do
