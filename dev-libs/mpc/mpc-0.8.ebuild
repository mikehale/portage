# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-libs/mpc/mpc-0.8.ebuild,v 1.2 2010/01/06 21:43:31 ranger Exp $

EAPI=0

DESCRIPTION="A library for multiprecision complex arithmetic with exact rounding."
HOMEPAGE="http://mpc.multiprecision.org/"
SRC_URI="http://www.multiprecision.org/mpc/download/${P}.tar.gz"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="~alpha ~amd64 ~arm ~hppa ~ia64 ~ppc ppc64 ~s390 ~sh ~sparc ~x86 ~x86-fbsd"
IUSE=""

DEPEND=">=dev-libs/gmp-4.2.3
		>=dev-libs/mpfr-2.3.1"
RDEPEND="${DEPEND}"

src_install() {
	emake DESTDIR="${D}" install || die
	dodoc "${S}"/{ChangeLog,NEWS,README,TODO}
}
