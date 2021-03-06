# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/app-editors/hteditor/hteditor-2.0.18.ebuild,v 1.2 2010/07/10 13:21:30 ssuominen Exp $

EAPI=3

MY_P=${P/editor}

DESCRIPTION="A file viewer, editor and analyzer for text, binary, and executable files"
HOMEPAGE="http://hte.sourceforge.net/"
SRC_URI="mirror://sourceforge/hte/${MY_P}.tar.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 ~ppc ~ppc64 x86 ~amd64-linux ~x86-linux ~ppc-macos ~x86-macos ~sparc-solaris ~x86-solaris"
IUSE="X"

RDEPEND="sys-libs/ncurses
	X? ( x11-libs/libX11 )
	>=dev-libs/lzo-2"
DEPEND="${RDEPEND}
	sys-devel/bison
	sys-devel/flex"

S=${WORKDIR}/${MY_P}

src_prepare() {
	sed -i \
		-e '/FLAGS_ALL/s:-ggdb -g3 -O0::' \
		configure || die
}

src_configure() {
	econf \
		$(use_enable X x11-textmode) \
		--disable-release
}

src_install() {
	emake DESTDIR="${D}" install || die
	dodoc AUTHORS ChangeLog KNOWNBUGS README TODO
	dohtml doc/*.html
	doinfo doc/*.info
}
