# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/x11-misc/sselp/sselp-0.2.ebuild,v 1.6 2010/07/20 18:35:18 ssuominen Exp $

inherit toolchain-funcs

DESCRIPTION="Simple X selection printer"
HOMEPAGE="http://www.suckless.org/programs/sselp.html"
SRC_URI="http://code.suckless.org/dl/tools/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~hppa ~ppc ~ppc64 ~x86"
IUSE=""

DEPEND="x11-libs/libX11"
RDEPEND="${DEPEND}"

src_unpack() {
	unpack ${A}
	cd "${S}"

	sed -i \
		-e "s|^CFLAGS = -std=c99 -pedantic -Wall -Os|CFLAGS += -std=c99 -pedantic -Wall|" \
		-e "s|^LDFLAGS = -s|LDFLAGS +=|" \
		-e "s|^CC = cc|CC = $(tc-getCC)|" \
		config.mk || die "sed failed"
}

src_install() {
	emake DESTDIR="${D}" PREFIX="/usr" install || die "emake install failed"
	dodoc README
}
