# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/app-crypt/pinentry/pinentry-0.7.5.ebuild,v 1.12 2010/01/02 21:46:50 yngwin Exp $

EAPI=1

inherit multilib eutils

DESCRIPTION="Collection of simple PIN or passphrase entry dialogs which utilize the Assuan protocol"
HOMEPAGE="http://www.gnupg.org/aegypten/"
SRC_URI="mirror://gnupg/${PN}/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="alpha amd64 arm hppa ia64 ~mips ppc ppc64 s390 sh sparc x86 ~x86-fbsd"
IUSE="gtk ncurses caps"

DEPEND="gtk? ( x11-libs/gtk+:2 )
	ncurses? ( sys-libs/ncurses )
	!gtk? ( !ncurses? ( sys-libs/ncurses ) )
	caps? ( sys-libs/libcap )"
RDEPEND="${DEPEND}"

src_unpack() {
	unpack ${A}
	cd "${S}"

	epatch "${FILESDIR}/${P}-grab.patch"
	epatch "${FILESDIR}/${PN}-gmem.patch"
}

src_compile() {
	local myconf=""

	if ! ( use gtk || use ncurses )
	then
		myconf="--enable-pinentry-curses --enable-fallback-curses"
	fi

	econf \
		--disable-dependency-tracking \
		--enable-maintainer-mode \
		--disable-pinentry-gtk \
		$(use_enable gtk pinentry-gtk2) \
		--disable-pinentry-qt \
		$(use_enable ncurses pinentry-curses) \
		$(use_enable ncurses fallback-curses) \
		$(use_with caps libcap) \
		${myconf}
	emake || die "emake failed"
}

src_install() {
	emake DESTDIR="${D}" install || die "make install failed"
	dodoc AUTHORS ChangeLog NEWS README THANKS TODO || die "dodoc failed"
}

pkg_postinst() {
	elog "We no longer install pinentry-curses and pinentry-qt SUID root by default."
	elog "Linux kernels >=2.6.9 support memory locking for unprivileged processes."
	elog "The soft resource limit for memory locking specifies the limit an"
	elog "unprivileged process may lock into memory. You can also use POSIX"
	elog "capabilities to allow pinentry to lock memory. To do so activate the caps"
	elog "USE flag and add the CAP_IPC_LOCK capability to the permitted set of"
	elog "your users."
}
