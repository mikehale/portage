# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-perl/Apache-AuthTicket/Apache-AuthTicket-0.40.ebuild,v 1.11 2009/09/13 16:14:09 armin76 Exp $

inherit perl-module
SRC_TEST="do"

DESCRIPTION="Cookie based access module."
HOMEPAGE="http://search.cpan.org/~mschout/Apache-AuthTicket-0.40/"
SRC_URI="mirror://cpan/authors/id/M/MS/MSCHOUT/${P}.tar.gz"

LICENSE="Artistic"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

DEPEND=">=dev-perl/Apache-AuthCookie-3.0
		dev-perl/DBI
		virtual/perl-Digest-MD5
		dev-perl/SQL-Abstract
		dev-lang/perl"
