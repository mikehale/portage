# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-libs/hashit/hashit-0.9.7.ebuild,v 1.1 2010/06/10 14:06:57 patrick Exp $

EAPI=3

inherit cmake-utils eutils

DESCRIPTION="Generic hash library implemented in C which supports multiple collision handling methods."
HOMEPAGE="http://www.pleyades.net/david/hashit.php"
SRC_URI="http://www.pleyades.net/david/projects/${PN}/${P}.tar.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86 ~ppc ~amd64"
IUSE="debug"

DEPEND=""
RDEPEND="${DEPEND}"

src_prepare() {
	epatch "${FILESDIR}/${P}-pkgconfig.patch"
}
