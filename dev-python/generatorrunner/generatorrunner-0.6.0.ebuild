# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-python/generatorrunner/generatorrunner-0.6.0.ebuild,v 1.1 2010/08/24 19:45:51 ayoy Exp $

EAPI="2"

inherit cmake-utils

DESCRIPTION="A tool that controls bindings generation"
HOMEPAGE="http://www.pyside.org/"
SRC_URI="http://www.pyside.org/files/${P}.tar.bz2"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="debug"

DEPEND=">=dev-python/apiextractor-0.7.0
	>=x11-libs/qt-core-4.5.0"
RDEPEND="${DEPEND}"

src_install() {
	cmake-utils_src_install
	dodoc AUTHORS ChangeLog || die "dodoc failed"
}
