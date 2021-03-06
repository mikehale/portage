# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/media-sound/gpodder/gpodder-0.17.0.ebuild,v 1.2 2010/01/07 14:37:19 fauli Exp $

EAPI=2

inherit distutils

DESCRIPTION="gPodder is a Podcast receiver/catcher written in Python, using GTK."
HOMEPAGE="http://gpodder.berlios.de/"
SRC_URI="mirror://berlios/${PN}/${P}.tar.gz"
LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~amd64-linux ~x86-linux ~x86-solaris"
IUSE="ipod libnotify mad"
RESTRICT="test"

RDEPEND="dev-python/feedparser
	dev-python/pygtk
	sys-devel/gettext
	libnotify? ( dev-python/notify-python )
	>=dev-python/pysqlite-2.4
	dev-python/eyeD3
	ipod? ( media-libs/libgpod[python] )
	mad? ( dev-python/pymad )"
DEPEND="${RDEPEND}
	dev-util/intltool
	media-gfx/imagemagick[png]
	sys-apps/help2man"

src_compile() {
	emake generators || die
	emake messages || die
	distutils_src_compile || die
}
