# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/sys-fs/lessfs/lessfs-1.1.6.ebuild,v 1.1 2010/08/26 13:18:01 hwoarang Exp $

EAPI="2"

inherit eutils

MY_PV="${PV/_/-}"
MY_P="${PN}-${MY_PV}"
DESCRIPTION="A high performance inline data deduplicating filesystem"
HOMEPAGE="http://www.lessfs.com"
SRC_URI="http://downloads.sourceforge.net/project/${PN}/${PN}/${P/_beta*/-beta}/${MY_P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="lzo crypt"

DEPEND=">=dev-db/tokyocabinet-1.4.42
		app-crypt/mhash
		>=sys-fs/fuse-2.8.0
		crypt? ( dev-libs/openssl )
		lzo? ( dev-libs/lzo )"

RDEPEND=""

S="${WORKDIR}/${MY_P}"

src_configure() {
	use crypt && myconf="--with-crypto"
	use lzo && myconf="${myconf} --with-lzo"
	econf ${myconf}
}

src_install () {
	emake DESTDIR="${D}" install || die "make install failed"
	dodoc ChangeLog NEWS README || die "dodpc failed"
	insinto /etc
	doins etc/lessfs.cfg

}

pkg_postinst() {
	elog
	elog "Default configuration file: /etc/${PN}.cfg"
	elog
}
