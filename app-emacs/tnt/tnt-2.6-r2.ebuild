# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/app-emacs/tnt/tnt-2.6-r2.ebuild,v 1.2 2009/11/23 13:21:28 maekke Exp $

inherit elisp

DESCRIPTION="Client for the AOL Instant Messenging service using Emacs as its UI"
HOMEPAGE="http://tnt.sourceforge.net/"
SRC_URI="mirror://sourceforge/${PN}/${P}.tar.gz"

LICENSE="Artistic"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

DOCS="ChangeLog PROTOCOL README"
ELISP_PATCHES="${P}-sound.patch"
SITEFILE="50${PN}-gentoo.el"

src_install() {
	elisp_src_install

	insinto "${SITEETC}/${PN}"
	doins sounds/* || die

	docinto procmail
	dodoc procmail/* || die
}
