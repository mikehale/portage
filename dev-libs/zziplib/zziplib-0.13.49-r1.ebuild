# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-libs/zziplib/zziplib-0.13.49-r1.ebuild,v 1.1 2008/08/29 18:24:43 vapier Exp $

inherit libtool fixheadtails eutils

DESCRIPTION="Lightweight library used to easily extract data from files archived in a single zip file"
HOMEPAGE="http://zziplib.sourceforge.net/"
SRC_URI="mirror://sourceforge/zziplib/${P}.tar.bz2"

LICENSE="|| ( LGPL-2.1 MPL-1.1 )"
SLOT="0"
KEYWORDS="~alpha ~amd64 ~arm ~hppa ~ia64 ~ppc ~ppc64 ~s390 ~sh -sparc ~x86 ~x86-fbsd"
IUSE="sdl"

RDEPEND=">=dev-lang/python-2.3
	sys-libs/zlib
	sdl? ( >=media-libs/libsdl-1.2.6 )"
DEPEND="${RDEPEND}
	dev-util/pkgconfig"

src_unpack() {
	unpack ${A}
	cd "${S}"
	epatch "${FILESDIR}"/${P}-python.patch
	epatch "${FILESDIR}"/${P}-SDL-test.patch
	sed -i '/^Libs:/s:@LDFLAGS@::' configure || die #235511
	sed -i '/^zzip-postinstall:/s:^:disabled-:' Makefile.in || die
	ht_fix_file configure docs/Makefile.in uses/depcomp
	elibtoolize
}

src_compile() {
	econf $(use_enable sdl) || die
	emake || die "emake failed"
}

src_test() {
	# need this because `make test` will always return true
	emake check || die "make check failed"
}

src_install() {
	emake DESTDIR="${D}" install install-man3 || die "make install failed"
	dodoc ChangeLog README TODO
	dohtml docs/*
}