# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/net-analyzer/ippl/ippl-1.4.14.ebuild,v 1.11 2007/04/28 12:35:52 tove Exp $

DESCRIPTION="A daemon which logs TCP/UDP/ICMP packets"
HOMEPAGE="http://pltplp.net/ippl/"
SRC_URI="http://pltplp.net/ippl/archive/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 ~ppc x86"
IUSE=""

DEPEND=">=dev-util/yacc-1.9.1-r1
	>=sys-devel/flex-2.5.4a-r4"
RDEPEND=""

src_install() {
	dosbin Source/ippl

	insinto "/etc"
	doins ippl.conf

	doman Docs/ippl.8 Docs/ippl.conf.5

	dodoc BUGS CREDITS HISTORY README TODO
	newdoc ippl.conf ippl.conf-sample

	newinitd "${FILESDIR}"/ippl.rc ippl
}
