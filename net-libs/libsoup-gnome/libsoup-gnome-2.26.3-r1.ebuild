# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/net-libs/libsoup-gnome/libsoup-gnome-2.26.3-r1.ebuild,v 1.13 2010/07/20 15:39:19 jer Exp $

EAPI="2"

inherit autotools eutils gnome2

MY_PN=${PN/-gnome}
MY_P=${MY_PN}-${PV}

DESCRIPTION="GNOME plugin for libsoup"
HOMEPAGE="http://www.gnome.org/"
SRC_URI="mirror://gnome/sources/${MY_PN}/${MY_P}.tar.bz2"

LICENSE="LGPL-2"
SLOT="2.4"
KEYWORDS="alpha amd64 arm ia64 ppc ppc64 sh sparc x86 ~x86-fbsd ~amd64-linux ~x86-solaris"
# Do NOT build with --disable-debug/--enable-debug=no - gnome2.eclass takes care of that
IUSE="debug doc"

RDEPEND="!<net-libs/libsoup-2.26.3-r3[gnome]
	~net-libs/libsoup-${PV}
	net-libs/libproxy
	>=gnome-base/gconf-2
	dev-db/sqlite:3"
DEPEND="${RDEPEND}
	>=dev-util/pkgconfig-0.9
	doc? ( >=dev-util/gtk-doc-1 )"

S=${WORKDIR}/${MY_P}

DOCS="AUTHORS NEWS README"

pkg_setup() {
	G2CONF="${G2CONF}
		--disable-static
		--with-libsoup-system
		--with-gnome"
}
src_prepare() {
	gnome2_src_prepare

	# Fix test to follow POSIX (for x86-fbsd)
	# No patch to prevent having to eautoreconf
	sed -e 's/\(test.*\)==/\1=/g' -i configure.in configure || die "sed failed"

	epatch "${FILESDIR}"/${P}-system-lib.patch
	eautoreconf
}
