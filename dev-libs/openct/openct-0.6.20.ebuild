# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-libs/openct/openct-0.6.20.ebuild,v 1.6 2010/05/20 01:50:06 jer Exp $

EAPI="2"

inherit eutils

DESCRIPTION="library for accessing smart card terminals"
HOMEPAGE="http://www.opensc-project.org/openct/"

SRC_URI="http://www.opensc-project.org/files/${PN}/${P}.tar.gz"
KEYWORDS="alpha amd64 arm hppa ia64 m68k ~mips ppc ppc64 s390 sh sparc x86"

LICENSE="LGPL-2.1"
SLOT="0"
IUSE="doc pcsc-lite usb"

RDEPEND="pcsc-lite? ( sys-apps/pcsc-lite )
		usb? ( virtual/libusb:0 )
		>=sys-fs/udev-096"

DEPEND="${RDEPEND}
	doc? ( app-doc/doxygen )"

pkg_setup() {
	enewgroup openct
	enewuser openctd
}

src_configure() {
	econf \
		--docdir="/usr/share/doc/${PF}" \
		--htmldir="/usr/share/doc/${PF}/html" \
		--localstatedir=/var \
		--with-udev="/$(get_libdir)/udev" \
		--enable-non-privileged \
		--with-daemon-user=openctd \
		--with-daemon-groups=usb \
		$(use_enable doc) \
		$(use_enable doc api-doc) \
		$(use_enable pcsc-lite pcsc) \
		$(use_enable usb)
}

src_install() {
	emake DESTDIR="${D}" install || die "emake install failed"

	insinto /etc/udev/rules.d/
	newins etc/openct.udev 70-openct.rules || die "newins 70-openct.rules failed"

	diropts -m0750 -gopenct -oopenctd
	keepdir /var/run/openct

	newinitd "${FILESDIR}"/openct.rc openct
}

pkg_postinst() {
	elog
	elog "You need to edit /etc/openct.conf to enable serial readers."
	elog
	elog "You should add \"openct\" to your default runlevel. To do so"
	elog "type \"rc-update add openct default\"."
	elog
	elog "You need to be a member of the (newly created) group openct to"
	elog "access smart card readers connected to this system. Set users'"
	elog "groups with usermod -G.  root always has access."
	elog
}
