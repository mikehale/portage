# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/app-misc/discomatic/discomatic-0.3.ebuild,v 1.11 2008/12/15 21:26:32 dertobi123 Exp $

inherit gnome2 eutils

DESCRIPTION="GTK+ CD-ROM archiving tool for mastering and burning multiple CD-ROM"
HOMEPAGE="http://discomatic.sourceforge.net"
SRC_URI="mirror://sourceforge/${PN}/${P}.tar.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ppc x86"
IUSE=""

RDEPEND="${DEPEND}
	virtual/cdrtools"
DEPEND=">=dev-libs/glib-2.2
	>=x11-libs/gtk+-2.2
	dev-util/pkgconfig"

src_unpack() {
	unpack ${A}
	cd "${S}"

	epatch "${FILESDIR}/${P}-glib.patch"
	epatch "${FILESDIR}/${P}-gcc43.patch"
}

DOCS="AUTHORS ChangeLog INSTALL NEWS README* TODO"
