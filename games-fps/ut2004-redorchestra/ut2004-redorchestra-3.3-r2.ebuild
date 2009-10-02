# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/games-fps/ut2004-redorchestra/ut2004-redorchestra-3.3-r2.ebuild,v 1.4 2009/10/01 22:14:21 nyhm Exp $

MOD_DESC="a World War II mod based on the Russian front"
MOD_NAME="Red Orchestra"
MOD_BINS="redorchestra"
MOD_TBZ2="red.orchestra red.orchestra_summer.offensive.map.pack-addon"
MOD_ICON="red.orchestra.xpm"

inherit games games-mods

HOMEPAGE="http://redorchestramod.gameservers.net/"
SRC_URI="mirror://liflg/red.orchestra_${PV}-english.run
	mirror://liflg/red.orchestra_summer.offensive.map.pack-addon.run"

LICENSE="freedist"
KEYWORDS="amd64 x86"
IUSE="dedicated opengl"

src_unpack() {
	games-mods_src_unpack
	rm unpack/StaticMeshes/BenTropicalSM01.usx \
		unpack/Textures/BenTropical01.utx || die "Removing files"
}
