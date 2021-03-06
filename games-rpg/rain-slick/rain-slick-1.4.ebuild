# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/games-rpg/rain-slick/rain-slick-1.4.ebuild,v 1.1 2008/10/29 18:47:19 vapier Exp $

inherit games

EP=${PV:0:1}
REV=${PV:2:1}

DESCRIPTION="On the Rain-Slick Precipice of Darkness, Episode One"
HOMEPAGE="http://www.playgreenhouse.com/game/HOTHG-000001-0${EP}/"
SRC_URI="http://files.playgreenhouse.com/rainslickep${EP}_linux_r${REV}.tgz"

LICENSE="as-is"
SLOT="${EP}"
KEYWORDS="~amd64 ~x86"
IUSE=""
RESTRICT="strip"

RDEPEND="sys-libs/glibc
	virtual/opengl
	x11-libs/libXrandr
	x11-libs/libX11
	x11-libs/libXext
	amd64? (
		app-emulation/emul-linux-x86-baselibs
		app-emulation/emul-linux-x86-xlibs
	)"

S=${WORKDIR}/rainslickep${EP}

src_install() {
	local dir="${GAMES_PREFIX_OPT}/${PN}/ep${EP}"
	dodir "${dir}"
	cp -pPR * "${D}/${dir}/" || die
	games_make_wrapper RainSlickEp${EP} "${dir}/RainSlickEp${EP}" || die
	prepgamesdirs
}
