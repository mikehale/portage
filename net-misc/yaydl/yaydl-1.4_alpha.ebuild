# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/net-misc/yaydl/yaydl-1.4_alpha.ebuild,v 1.1 2010/02/24 22:05:16 volkmar Exp $

EAPI="2"

MY_PV="1.4a"
MY_P=${PN}-${MY_PV}

DESCRIPTION="Yet Another Youtube DownLoader which is downloading more than youtube"
HOMEPAGE="http://pdes-net.org/x-haui/"
SRC_URI="http://pdes-net.org/x-haui/scripts/perl/yaydl_youtubedownloader/${MY_P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~ppc ~x86"
IUSE="encode soundextract"

DEPEND=""
RDEPEND="dev-lang/perl
	dev-perl/LWP-UserAgent-Determined
	dev-perl/MP3-Info
	dev-perl/Term-ProgressBar
	dev-perl/URI
	encode? ( || ( media-video/ffmpeg[encode]
		media-video/mplayer[encode,mp3,xvid] ) )
	soundextract? ( || ( media-video/ffmpeg[encode,mp3]
		( media-video/mplayer media-sound/lame ) ) )"

S=${WORKDIR}/${MY_P}

src_install() {
	exeinto /usr/bin
	newexe ${PN}.pl ${PN} || die "newexe failed"
	dodoc changelog README || die "dodoc failed"
}

pkg_postinst() {
	elog "${PN} is supporting a lot of video websites."
	elog "Look at ${HOMEPAGE} for more information."
}
