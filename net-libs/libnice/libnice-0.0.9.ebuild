# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/net-libs/libnice/libnice-0.0.9.ebuild,v 1.9 2010/02/12 18:39:44 josejx Exp $

EAPI="2"

DESCRIPTION="An implementation of the Interactice Connectivity Establishment standard (ICE)"
HOMEPAGE="http://nice.freedesktop.org/wiki/"
SRC_URI="http://nice.freedesktop.org/releases/${P}.tar.gz"

LICENSE="LGPL-2.1 MPL-1.1"
SLOT="0"
KEYWORDS="alpha amd64 hppa ppc ~ppc64 x86"
IUSE="+gstreamer upnp"

RDEPEND=">=dev-libs/glib-2.10
	gstreamer? (
		media-libs/gstreamer:0.10
		media-libs/gst-plugins-base:0.10 )
	upnp? ( >=net-libs/gupnp-igd-0.1.3 )"
DEPEND="${RDEPEND}
	dev-util/pkgconfig"

src_configure() {
	econf $(use_with gstreamer)
}

src_install() {
	emake DESTDIR="${D}" install || die "emake install failed."
	dodoc AUTHORS COPYING* README NEWS || die "dodoc failed."
}
