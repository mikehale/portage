# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-python/generatorrunner/generatorrunner-0.3.2.ebuild,v 1.1 2009/12/20 16:24:49 ayoy Exp $

EAPI="2"

inherit cmake-utils

DESCRIPTION="A tool that controls bindings generation"
HOMEPAGE="http://www.pyside.org/"
SRC_URI="http://www.pyside.org/files/${P}.tar.bz2"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="debug"

DEPEND="~dev-python/apiextractor-${PV}
	>=x11-libs/qt-core-4.5.0"
RDEPEND="${DEPEND}"

src_prepare() {
	sed -e 's/-2.6//' -i CMakeLists.txt || die "sed failed"
}

src_install() {
	cmake-utils_src_install
	dodoc AUTHORS ChangeLog || die "dodoc failed"
}
