# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/net-misc/streamtuner/streamtuner-0.99.99-r5.ebuild,v 1.3 2009/07/17 18:51:21 ssuominen Exp $

EAPI=2
GCONF_DEBUG=no
inherit eutils gnome2

DESCRIPTION="Stream directory browser for browsing internet radio streams"
HOMEPAGE="http://www.nongnu.org/streamtuner"
SRC_URI="http://savannah.nongnu.org/download/${PN}/${P}.tar.gz
	 http://savannah.nongnu.org/download/${PN}/${P}-pygtk-2.6.diff"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 ~ppc ~sparc x86"
IUSE="python +shout +xiph"

RDEPEND=">=x11-libs/gtk+-2.4
	net-misc/curl
	app-text/scrollkeeper
	xiph? ( dev-libs/libxml2 )
	>=media-libs/taglib-1.2
	python? ( dev-python/pygtk )
	x11-misc/xdg-utils"
DEPEND="${RDEPEND}
	dev-util/pkgconfig"

pkg_setup() {
	# live365 causes parse errors at connect time.
	G2CONF="--disable-live365 $(use_enable python)
		$(use_enable shout shoutcast) $(use_enable xiph)"
	DOCS="AUTHORS NEWS README TODO"
}

src_prepare() {
	gnome2_src_prepare
	epatch "${FILESDIR}"/${P}-gentoo.patch \
		"${FILESDIR}"/${P}-shoutcast.patch \
		"${FILESDIR}"/${P}-shoutcast-2.patch \
		"${FILESDIR}"/${P}-audacious.patch \
		"${DISTDIR}"/${P}-pygtk-2.6.diff \
		"${FILESDIR}"/${P}-stack_increase.patch
}
