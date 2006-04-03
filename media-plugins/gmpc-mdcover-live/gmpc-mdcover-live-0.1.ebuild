# Copyright 1999-2005 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

IUSE="gnome"

ESVN_REPO_URI="https://svn.qballcow.nl/gmpc-mdcover/trunk/"
ESVN_BOOTSTRAP="autogen.sh"
inherit subversion

DESCRIPTION="A GMPC plugin to generate playlists based on rules"
HOMEPAGE="http://etomite.qballcow.nl/qgmpc-0.12.html"

KEYWORDS="~amd64 ~ppc ~sparc ~x86"
SLOT="0"
LICENSE="GPL-2"

DEPEND="net-misc/curl
	media-sound/gmpc-live"

src_install()  {
        insinto "/usr/share/gmpc/plugins"
        doins "src/.libs/mdcaplugin.so"
}
