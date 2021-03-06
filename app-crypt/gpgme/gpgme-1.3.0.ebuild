# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/app-crypt/gpgme/gpgme-1.3.0.ebuild,v 1.7 2010/07/21 17:10:15 ssuominen Exp $

EAPI="3"

inherit eutils libtool

DESCRIPTION="GnuPG Made Easy is a library for making GnuPG easier to use"
HOMEPAGE="http://www.gnupg.org/related_software/gpgme"
SRC_URI="mirror://gnupg/gpgme/${P}.tar.bz2"

LICENSE="GPL-2 LGPL-2.1"
SLOT="1"
KEYWORDS="~alpha amd64 ~arm hppa ~ia64 ~mips ppc ppc64 ~sparc x86 ~x86-fbsd ~x64-freebsd ~amd64-linux ~x86-linux ~ppc-macos ~x64-macos ~x86-macos ~x86-solaris"
IUSE="common-lisp pth"

DEPEND="app-crypt/gnupg
	>=dev-libs/libassuan-1.1.0
	>=dev-libs/libgpg-error-1.4
	pth? ( >=dev-libs/pth-1.2 )"
RDEPEND="${DEPEND}"

src_prepare() {
	epatch "${FILESDIR}/${PN}-1.1.8-et_EE.patch"

	# Call elibtoolize to get sane .so versioning on FreeBSD.
	elibtoolize
}

src_configure() {
	econf \
		--includedir="${EPREFIX}/usr/include/gpgme" \
		--with-gpg="${EPREFIX}/usr/bin/gpg" \
		--with-gpgsm="${EPREFIX}/usr/bin/gpgsm" \
		$(use_with pth)
}

src_install() {
	emake DESTDIR="${D}" install || die "emake install failed"
	dodoc AUTHORS ChangeLog NEWS README THANKS TODO

	if ! use common-lisp; then
		rm -fr "${ED}usr/share/common-lisp"
	fi
}
