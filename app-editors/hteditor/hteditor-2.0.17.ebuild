# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/app-editors/hteditor/hteditor-2.0.17.ebuild,v 1.6 2010/07/10 13:21:30 ssuominen Exp $

MY_PV=${PV/_/}

DESCRIPTION="editor for executable files"
HOMEPAGE="http://hte.sourceforge.net/"
SRC_URI="mirror://sourceforge/hte/ht-${MY_PV}.tar.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="ppc"
IUSE="X"

RDEPEND="sys-libs/ncurses
	X? ( x11-libs/libX11 )
	>=dev-libs/lzo-2"
DEPEND="${RDEPEND}
	sys-devel/bison
	sys-devel/flex"

S=${WORKDIR}/ht-${MY_PV}

src_unpack() {
	unpack ${A}
	sed -i -e 's:-ggdb -g3 -O0:$CFLAGS:' "${S}"/configure || die "sed failed"
}

src_compile() {
	econf --disable-release $(use_enable X x11-textmode)
	emake || die "emake failed."
}

src_install() {
	emake DESTDIR="${D}" install || die "emake install failed."
	dodoc AUTHORS KNOWNBUGS TODO README ChangeLog
	dohtml doc/ht.html
	doinfo doc/ht.info doc/hthelp.info
}
