# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-util/radare/radare-1.2.1-r1.ebuild,v 1.2 2009/02/16 21:56:04 mr_bones_ Exp $

inherit eutils

DESCRIPTION="Advanced command line hexadecimail editor and more"
HOMEPAGE="http://radare.nopcode.org"
SRC_URI="http://radare.nopcode.org/get/radare-${PV}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE="gui"

DEPEND="sys-libs/readline
		dev-lang/python
		"
RDEPEND="${DEPEND}"

src_unpack() {
	unpack ${A} && cd "${S}"
	epatch "${FILESDIR}/${P}-as-needed.patch"
}

src_compile() {
	econf $(use_with gui) || die "configure failed"
	emake -j1 || die "compile failed"
}

src_install() {
	emake DESTDIR="${D}" install || die "install failed"
}
