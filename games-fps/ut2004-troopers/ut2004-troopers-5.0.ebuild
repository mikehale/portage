# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/games-fps/ut2004-troopers/ut2004-troopers-5.0.ebuild,v 1.3 2009/10/01 22:17:18 nyhm Exp $

MOD_DESC="Star Wars mod"
MOD_NAME="Troopers"
MOD_BINS="troopers"
MOD_TBZ2="troopers"
MOD_ICON="troopers.png"

inherit games games-mods

HOMEPAGE="http://www.ut2004troopers.com/"
SRC_URI="mirror://liflg/troopers_${PV}-english.run"

LICENSE="freedist"
KEYWORDS="amd64 x86"
IUSE="dedicated opengl"
