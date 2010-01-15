# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-libs/tre/tre-0.8.0.ebuild,v 1.3 2010/01/14 21:42:10 fauli Exp $

EAPI=2

DESCRIPTION="Lightweight, robust, and efficient POSIX compliant regexp matching library."
HOMEPAGE="http://laurikari.net/tre/"
SRC_URI="http://laurikari.net/tre/${P}.tar.bz2"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="~alpha ~amd64 ~hppa ~ia64 ~ppc ~ppc64 ~sparc ~x86 ~x86-fbsd ~x86-freebsd ~amd64-linux ~x86-linux ~x86-solaris"
IUSE="nls static-libs"

RDEPEND="!app-misc/glimpse
	!app-text/agrep"
DEPEND="${RDEPEND}
	dev-util/pkgconfig
	nls? ( sys-devel/gettext )"

src_configure() {
	econf \
		--disable-dependency-tracking \
		--enable-agrep \
		--enable-system-abi \
		$(use_enable nls) \
		$(use_enable static-libs static)
}

src_install() {
	emake DESTDIR="${D}" install || die
	dodoc AUTHORS ChangeLog NEWS README THANKS TODO
	dohtml doc/*.{css,html}
}

pkg_postinst() {
	ewarn ""
	ewarn "app-misc/glimpse, app-text/agrep and this package all provide agrep."
	ewarn "If this causes any unforeseen incompatibilities please file a bug"
	ewarn "on http://bugs.gentoo.org."
	ewarn ""
}
