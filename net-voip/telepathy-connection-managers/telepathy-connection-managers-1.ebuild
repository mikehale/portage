# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/net-voip/telepathy-connection-managers/telepathy-connection-managers-1.ebuild,v 1.10 2010/08/07 16:58:06 armin76 Exp $

DESCRIPTION="Meta-package for Telepathy Connection Managers"

HOMEPAGE="http://telepathy.freedesktop.org/"
SRC_URI=""
LICENSE="as-is"
SLOT="0"

KEYWORDS="alpha amd64 ia64 ~ppc sparc x86"

IUSE="msn irc yahoo icq jabber sip zeroconf"

DEPEND=""
# These version support the 0.18.0 Telepathy specification
# They work with Mission Control 5.2
RDEPEND="msn? ( >=net-voip/telepathy-butterfly-0.5.0 )
	jabber? ( >=net-voip/telepathy-gabble-0.8.0 )
	sip? ( >=net-voip/telepathy-sofiasip-0.5.18 )
	zeroconf? ( >=net-voip/telepathy-salut-0.3.10 )
	icq? ( >=net-voip/telepathy-haze-0.3.2 )
	yahoo? ( >=net-voip/telepathy-haze-0.3.2 )
	irc? ( >=net-irc/telepathy-idle-0.1.5 )"
