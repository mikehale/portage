# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-perl/Net-DBus/Net-DBus-0.33.6.ebuild,v 1.7 2010/08/11 15:59:11 josejx Exp $

MODULE_AUTHOR=DANBERR
inherit perl-module

DESCRIPTION="Perl extension for the DBus message system"

LICENSE="|| ( Artistic GPL-2 )"
SLOT="0"
KEYWORDS="~alpha amd64 ~ia64 ~ppc sparc x86"
IUSE="test"

SRC_TEST="do"

RDEPEND="dev-lang/perl
	sys-apps/dbus
	dev-perl/XML-Twig"
DEPEND="${RDEPEND}
	dev-util/pkgconfig
	test? ( dev-perl/Test-Pod
		dev-perl/Test-Pod-Coverage )"
