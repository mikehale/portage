# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/media-libs/quvi/quvi-0.1.4.ebuild,v 1.1 2010/04/12 10:08:43 aballier Exp $

EAPI=2

DESCRIPTION="library for parsing video download links"
HOMEPAGE="http://code.google.com/p/quvi/"
SRC_URI="http://quvi.googlecode.com/files/${P}.tar.bz2"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~ppc64 ~x86"
IUSE="test offensive"

RDEPEND=">=net-misc/curl-7.18.0
	>=dev-libs/libpcre-7.9[cxx]"
DEPEND="${RDEPEND}
	dev-util/pkgconfig"

src_configure() {
	econf $(use_enable offensive smut) || die
}

src_install() {
	emake DESTDIR="${D}" install || die
	dodoc ChangeLog README TODO || die "dodoc failed"
}

src_test() {
	local value

	ewarn "Tests require internet connection in order to work."

	use offensive && value="true" || value="false"
	ADULT_OK="${value}" emake check || die "emake test failed"
}
