# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

inherit perl-module

DESCRIPTION="Perl interface to Facebook Platform API"
HOMEPAGE="http://search.cpan.org/dist/${PN}/"
SRC_URI="mirror://cpan/authors/id/U/UN/UNOBE/${P}.tar.gz"

IUSE=""

SLOT="0"
LICENSE="|| ( Artistic GPL-2 )"
KEYWORDS="alpha amd64 arm hppa ia64 m68k mips ppc ppc64 ppc-macos s390 sh sparc sparc-fbsd x86 x86-fbsd"

DEPEND="
    dev-perl/version
	dev-perl/Crypt-SSLeay
	dev-perl/JSON-Any
    dev-perl/libwww-perl
	dev-perl/Readonly
"
