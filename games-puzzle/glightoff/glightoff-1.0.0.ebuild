# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/games-puzzle/glightoff/glightoff-1.0.0.ebuild,v 1.6 2009/11/30 13:50:22 volkmar Exp $

inherit gnome2

DESCRIPTION="a simple (but not so easy to solve!) puzzle game"
HOMEPAGE="http://glightoff.sourceforge.net/"
SRC_URI="mirror://sourceforge/${PN}/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~ppc x86"
IUSE=""

DEPEND=">=x11-libs/gtk+-2.6
	gnome-base/librsvg"
