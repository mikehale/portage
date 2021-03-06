# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/net-libs/libpri/libpri-1.4.9.ebuild,v 1.3 2009/07/27 12:04:10 volkmar Exp $

EAPI="2"

inherit eutils

DESCRIPTION="Primary Rate ISDN (PRI) library"
HOMEPAGE="http://www.asterisk.org/"
SRC_URI="http://downloads.digium.com/pub/${PN}/${P}.tar.gz"

SLOT="0"
LICENSE="GPL-2"
KEYWORDS="~amd64 ~x86 ~ppc ~sparc"
IUSE=""

src_prepare() {
	epatch "${FILESDIR}/${P}-respect-cflags.patch"
	epatch "${FILESDIR}/${P}-multilib.patch"

	# remove -Werror, fix bug 260923
	sed -i -e "s/-Werror //" Makefile || die "sed failed"
}

src_install() {
	emake INSTALL_PREFIX="${D}" LIBDIR="${D}/usr/$(get_libdir)" install \
		|| die "emake install failed"

	dodoc ChangeLog README TODO || die "dodoc failed"
}
