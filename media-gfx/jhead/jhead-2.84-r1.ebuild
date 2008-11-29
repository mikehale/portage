# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/media-gfx/jhead/jhead-2.84-r1.ebuild,v 1.4 2008/11/29 16:56:38 armin76 Exp $

inherit toolchain-funcs eutils

DESCRIPTION="Exif Jpeg camera setting parser and thumbnail remover"
HOMEPAGE="http://www.sentex.net/~mwandel/jhead"
SRC_URI="http://www.sentex.net/~mwandel/${PN}/${P}.tar.gz"

LICENSE="public-domain"
SLOT="0"
KEYWORDS="alpha ~amd64 hppa ia64 ppc ~ppc64 sparc x86"
IUSE=""

src_unpack() {
	unpack ${A}
	cd "${S}"
	epatch "${FILESDIR}"/${P}-bug243238.patch
}

src_compile() {
	tc-export CC
	emake || die "emake failed."
}

src_install() {
	dobin ${PN} || die "dobin failed."
	dodoc *.txt
	dohtml *.html
	doman ${PN}.1.gz
}