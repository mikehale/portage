# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/app-text/multitail/multitail-5.2.2-r1.ebuild,v 1.1 2010/02/03 21:47:59 jlec Exp $

EAPI="2"

inherit flag-o-matic toolchain-funcs eutils

DESCRIPTION="Tail with multiple windows"
HOMEPAGE="http://www.vanheusden.com/multitail/index.html"
SRC_URI="http://www.vanheusden.com/multitail/${P}.tgz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~hppa ~ia64 ~ppc ~sparc ~x86"
IUSE="debug doc examples"

DEPEND="sys-libs/ncurses"
RDEPEND="${DEPEND}"

src_prepare() {
	epatch "${FILESDIR}/${PV}-as-needed.patch"
}

src_configure() {
	tc-export CC
	use debug && append-flags "-D_DEBUG"
}

src_install () {
	dobin multitail || die

	insinto /etc
	doins multitail.conf || die

	dodoc Changes readme.txt thanks.txt || die
	doman multitail.1 || die

	if use examples; then
		docinto examples
		dodoc colors-example.{pl,sh} convert-{geoip,simple}.pl || die
	fi

	if use doc; then
		dohtml manual.html || die
	fi
}
