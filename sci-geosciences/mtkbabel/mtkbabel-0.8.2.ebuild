# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/sci-geosciences/mtkbabel/mtkbabel-0.8.2.ebuild,v 1.1 2010/04/27 10:44:07 scarabeus Exp $

EAPI="3"

DESCRIPTION="MTKBabel is a Perl program to operate the i-Blue 747 GPS data logger."
HOMEPAGE="http://sourceforge.net/projects/mtkbabel/"
SRC_URI="mirror://sourceforge/${PN}/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="
	dev-perl/Device-SerialPort
	dev-perl/TimeDate
"

src_install() {
	doman mtkbabel.1 || die
	dobin mtkbabel || die
	dodoc MtkExtensionsv1.xsd README changelog || die
}
