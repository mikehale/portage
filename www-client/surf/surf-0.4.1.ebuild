# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/www-client/surf/surf-0.4.1.ebuild,v 1.2 2010/07/13 18:32:38 hwoarang Exp $

EAPI="2"

inherit eutils savedconfig toolchain-funcs

DESCRIPTION="a simple web browser based on WebKit/GTK+"
HOMEPAGE="http://surf.suckless.org/"
SRC_URI="http://dl.suckless.org/${PN}/${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=">=net-libs/webkit-gtk-1.1.14"
RDEPEND="
	!media-gfx/surf
	!savedconfig? ( net-misc/wget x11-terms/xterm )
	${DEPEND}
"

pkg_setup() {
	elog "net-misc/wget and x11-terms/xterm will be installed by default to"
	elog "support the default download command, which can be changed through"
	elog "the savedconfig mechanism. If you enable USE=savedconfig, you will"
	elog "need to satisfy requirements for the alternative download command"
	elog "yourself."
}

src_prepare() {
	sed -i \
		-e 's|{|(|g;s|}|)|g' \
		-e 's|\t@|\t|g;s|echo|@&|g' \
		-e 's|^LIBS.*|LIBS = $(GTKLIB) -lgthread-2.0|g' \
		-e 's|^LDFLAGS.*|LDFLAGS += $(LIBS)|g' \
		-e 's|^CC.*|CC ?= gcc|g' \
		-e 's|^CFLAGS.*|CFLAGS += -std=c99 -pedantic -Wall $(INCS) $(CPPFLAGS)|g' \
		config.mk Makefile || die "sed failed"
	restore_config config.h
}

src_compile() {
	emake CC=$(tc-getCC) || die "emake compile failed"
}

src_install() {
	emake DESTDIR="${D}" PREFIX="/usr" install || die "emake install failed"
	save_config config.h
}
