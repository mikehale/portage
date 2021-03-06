# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/app-arch/upx-ucl/upx-ucl-2.02.ebuild,v 1.2 2009/10/12 17:06:59 halcy0n Exp $

inherit eutils toolchain-funcs

MY_P="${P/-ucl/}-src"
DESCRIPTION="upx is the Ultimate Packer for eXecutables."
HOMEPAGE="http://upx.sourceforge.net"
SRC_URI="http://upx.sourceforge.net/download/${MY_P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~sparc ~x86"

IUSE=""

DEPEND=">=dev-libs/ucl-1.02
	dev-lang/perl
	!app-arch/upx"

S="${WORKDIR}/${MY_P}"

src_compile() {
	#make -C src UPX_UCLDIR=/usr || die "Failed compiling"
	make all || die
}

src_install() {
	newbin src/upx.out upx

	dodoc BUGS NEWS PROJECTS README* THANKS TODO doc/upx.doc
	dohtml doc/upx.html
	doman doc/upx.1
}
