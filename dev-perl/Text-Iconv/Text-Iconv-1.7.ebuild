# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-perl/Text-Iconv/Text-Iconv-1.7.ebuild,v 1.8 2010/01/14 15:33:52 grobian Exp $

inherit perl-module

DESCRIPTION="A Perl interface to the iconv() codeset conversion function"
HOMEPAGE="http://search.cpan.org/~mpiotr"
SRC_URI="mirror://cpan/authors/id/M/MP/MPIOTR/${P}.tar.gz"

LICENSE="Artistic"
SLOT="0"
KEYWORDS="alpha amd64 arm hppa ia64 ~mips ppc ppc64 s390 sh sparc x86 ~x86-fbsd ~amd64-linux ~x86-linux ~ppc-macos ~x86-macos ~sparc-solaris"
IUSE=""

DEPEND="dev-lang/perl"
