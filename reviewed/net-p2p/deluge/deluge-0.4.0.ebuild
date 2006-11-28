# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils multilib

DESCRIPTION="BitTorrent client in Python and PyGTK."
HOMEPAGE="http://deluge-torrent.org/"
SRC_URI="http://deluge.mynimalistic.net/downloads/${PN}_${PV}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""
S="${WORKDIR}/${PN}"

DEPEND=">dev-lang/python-2.3
	dev-libs/boost
	>=dev-python/pygtk-2
	=dev-python/python-libtorrent-${PV}
	dev-python/pyxdg"
RDEPEND="${DEPEND}"

src_unpack() {
	unpack ${A} && cd "${S}"
	# remove .svn dirs
	rm -rf */.svn
}

src_install() {
	dodir "/usr/$(get_libdir)/${PN}"
	insinto "/usr/$(get_libdir)/${PN}"
	doins -r *.py po/ glade/ pixmaps/ plugins/

	newicon pixmaps/${PN}-32.png ${PN}.png
	make_wrapper ${PN} "/usr/bin/python /usr/$(get_libdir)/${PN}/${PN}.py"
	make_desktop_entry ${PN} ${PN}

	dodoc Changelog README
}
