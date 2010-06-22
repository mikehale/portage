# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/sci-calculators/galculator/galculator-1.3.4.ebuild,v 1.7 2010/06/22 12:56:56 ssuominen Exp $

EAPI=2

DESCRIPTION="GTK+ based algebraic and RPN calculator."
HOMEPAGE="http://galculator.sourceforge.net/"
SRC_URI="mirror://sourceforge/${PN}/${P}.tar.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="alpha amd64 ppc x86 ~x86-fbsd ~x86-freebsd ~amd64-linux ~x86-linux ~ppc-macos"
IUSE=""

RDEPEND=">=x11-libs/gtk+-2.6
	>=gnome-base/libglade-2"
DEPEND="${RDEPEND}
	dev-util/pkgconfig"

src_prepare() {
	# Fix tests
	echo ui/*.glade | tr -t ' ' '\n' >> po/POTFILES.in
}

src_install() {
	emake DESTDIR="${D}" install || die
	dodoc AUTHORS ChangeLog NEWS README THANKS TODO || die
}
