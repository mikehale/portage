# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/app-crypt/quickcrypt/quickcrypt-0.9.2b.ebuild,v 1.16 2006/02/11 21:06:42 mcummings Exp $

MY_P=${P/-/_}
S=${WORKDIR}/${MY_P}
DESCRIPTION="gives you a quick MD5 Password from any string"
HOMEPAGE="http://linux.netpimpz.com/quickcrypt/"
SRC_URI="http://linux.netpimpz.com/quickcrypt/download/${MY_P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="x86 sparc ppc alpha amd64 ia64 hppa ~mips"
IUSE=""

DEPEND=">=dev-lang/perl-5.6
	virtual/perl-Digest-MD5"

src_install() {
	dobin quickcrypt || die
	dodoc README BUGS
}
