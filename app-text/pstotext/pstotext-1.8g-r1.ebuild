# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/app-text/pstotext/pstotext-1.8g-r1.ebuild,v 1.6 2009/12/26 19:47:13 pva Exp $

inherit eutils

DESCRIPTION="extract ASCII text from a PostScript or PDF file"
HOMEPAGE="http://research.compaq.com/SRC/virtualpaper/pstotext.html"
SRC_URI="http://research.compaq.com/SRC/virtualpaper/binaries/pstotext.tar.Z"

LICENSE="PSTT"
SLOT="0"
KEYWORDS="~amd64 ppc ppc64 sparc x86"
IUSE=""

DEPEND="app-arch/ncompress"

RDEPEND="app-text/ghostscript-gpl"

S=${WORKDIR}/${PN}

src_unpack() {
	unpack ${A}
	cd ${S}
	epatch "${FILESDIR}"/${PN}-1.8g-dsafer.patch
}

src_compile() {
	emake || die
}

src_install () {
	into /usr
	dobin pstotext
	doman pstotext.1
}
