# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-util/cocom/cocom-0.996.ebuild,v 1.3 2009/09/29 09:19:20 maekke Exp $

inherit autotools

DESCRIPTION="Toolset to help create compilers, cross-compilers, interpreters, and other language processors"
HOMEPAGE="http://cocom.sourceforge.net/"
SRC_URI="mirror://sourceforge/${PN}/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~x86"
IUSE=""
RDEPEND="!media-gfx/hugin"
DEPEND="${RDEPEND}"

src_unpack() {
	unpack ${A}
	cd "${S}"/REGEX
	eautoconf
}

src_install() {
	emake install DESTDIR="${D}" || die
	dodoc CHANGES README
}
