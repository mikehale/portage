# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/app-arch/cpio/cpio-2.11.ebuild,v 1.7 2010/07/18 20:47:44 josejx Exp $

EAPI="2"

DESCRIPTION="A file archival tool which can also read and write tar files"
HOMEPAGE="http://www.gnu.org/software/cpio/cpio.html"
SRC_URI="mirror://gnu/cpio/${P}.tar.bz2"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="alpha amd64 arm hppa ia64 m68k ~mips ppc ppc64 s390 sh sparc x86 ~sparc-fbsd ~x86-fbsd"
IUSE="nls"

src_configure() {
	econf \
		$(use_enable nls) \
		--bindir=/bin \
		--with-rmt=/usr/sbin/rmt \
		|| die
}

src_install() {
	emake install DESTDIR="${D}" || die
	dodoc ChangeLog NEWS README
	rm "${D}"/usr/share/man/man1/mt.1 || die
	rmdir "${D}"/usr/libexec || die
}
