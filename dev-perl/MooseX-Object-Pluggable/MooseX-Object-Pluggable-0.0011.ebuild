# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-perl/MooseX-Object-Pluggable/MooseX-Object-Pluggable-0.0011.ebuild,v 1.1 2009/06/23 07:44:32 robbat2 Exp $

EAPI=2
MODULE_AUTHOR="GRODITI"

inherit perl-module

DESCRIPTION="Make your classes pluggable"

IUSE=""

SLOT="0"
LICENSE="|| ( Artistic GPL-2 )"
KEYWORDS="~amd64 ~x86"

DEPEND="virtual/perl-Module-Pluggable
	dev-perl/Moose"
RDEPEND="${DEPEND}"
