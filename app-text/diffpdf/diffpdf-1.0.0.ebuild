# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/app-text/diffpdf/diffpdf-1.0.0.ebuild,v 1.1 2010/05/19 17:38:08 reavertm Exp $

EAPI="2"

inherit qt4-r2

DESCRIPTION="Program that textually or visually compares two PDF files"
HOMEPAGE="http://www.qtrac.eu/diffpdf.html"
SRC_URI="http://www.qtrac.eu/${P}.tar.gz"

LICENSE="GPL-2"
KEYWORDS="~amd64 ~x86"
SLOT="0"
IUSE=""

DEPEND="
	>=app-text/poppler-0.12.3
	>=x11-libs/qt-core-4.5:4
	>=x11-libs/qt-gui-4.5:4
"
RDEPEND="${DEPEND}"

DOCS="README"

src_install() {
	qt4-r2_src_install

	dobin diffpdf || die 'dobin failed'
	doman diffpdf.1 || die 'doman failed'
}
