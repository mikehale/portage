# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/net-analyzer/gspoof/gspoof-3.2-r1.ebuild,v 1.1 2010/08/21 15:23:25 xarthisius Exp $

EAPI="2"

inherit eutils

DESCRIPTION="A simple GTK/command line TCP/IP packet generator"
HOMEPAGE="http://gspoof.sourceforge.net/"
SRC_URI="http://gspoof.sourceforge.net/src/${P}.tar.gz"
LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~x86"

IUSE=""

DEPEND="x11-libs/gtk+:2
	dev-libs/glib:2
	net-libs/libnet:1.1"
RDEPEND="${DEPEND}"

src_prepare() {
	epatch "${FILESDIR}"/${PN}-def-values.patch \
		"${FILESDIR}"/${P}-icon.patch
}

src_compile() {
	emake CFLAGS="${CFLAGS}" LDFLAGS="${LDFLAGS}" || die
}

src_install() {
	dobin gspoof || die
	newicon pixmap/icon.png ${PN}.png || die
	dodoc README CHANGELOG TODO || die
}
