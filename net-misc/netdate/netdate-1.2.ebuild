# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/net-misc/netdate/netdate-1.2.ebuild,v 1.8 2006/11/12 04:00:07 vapier Exp $

DESCRIPTION="A Utility to synchronize the time with ntp-servers"
HOMEPAGE="ftp://ftp.suse.com/pub/people/kukuk/ipv6/"
SRC_URI="ftp://ftp.suse.com/pub/people/kukuk/ipv6/${P}.tar.bz2"

LICENSE="public-domain"
SLOT="0"
KEYWORDS="amd64 arm mips s390 sh sparc x86"
IUSE=""

DEPEND=""

S=${WORKDIR}/${PN}

src_compile() {
	emake || die "make failed"
}

src_install() {
	dobin netdate || die
	doman netdate.8
	dodoc README
}
