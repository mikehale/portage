# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/x11-misc/bbmail/bbmail-0.8.3.ebuild,v 1.9 2010/07/21 14:32:28 ssuominen Exp $

DESCRIPTION="blackbox mail notification"
HOMEPAGE="http://bbtools.windsofstorm.net/available.phtml#bbmail"
SRC_URI="http://bbtools.windsofstorm.net/sources/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="ppc sparc x86 ~x86-fbsd"
IUSE=""

DEPEND="virtual/blackbox"

src_install() {
	emake DESTDIR="${D}" install || die
	dobin scripts/bbmailparsefm.pl
	dodoc AUTHORS BUGS ChangeLog NEWS README TODO
}
