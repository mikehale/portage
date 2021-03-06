# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/app-editors/conglomerate/conglomerate-0.9.0.ebuild,v 1.6 2007/10/11 19:01:43 remi Exp $

inherit gnome2

DESCRIPTION="An XML editor designed for DocBook and similar formats"
HOMEPAGE="http://www.conglomerate.org/"
SRC_URI="mirror://sourceforge/${PN}/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ppc x86"
IUSE="doc spell"

RDEPEND=">=x11-libs/gtk+-2.4
	dev-libs/libxml2
	dev-libs/libxslt
	>=gnome-base/libgnomeprint-1.116
	>=gnome-base/libgnomeprintui-1.116
	>=gnome-base/libbonobo-2
	>=gnome-base/libbonoboui-2
	>=gnome-base/libgnomeui-2
	>=gnome-base/libglade-2
	=x11-libs/gtksourceview-1*
	spell? ( >=app-text/enchant-0.1 )
	"

DEPEND="${RDEPEND}
	>=dev-util/intltool-0.30
	dev-util/pkgconfig
	app-text/scrollkeeper
	doc? ( >=dev-util/gtk-doc-1 )"

DOCS="AUTHORS BUGS ChangeLog INSTALL NEWS README* TODO"

G2CONF="${G2CONF} $(use_enable spell enchant) --enable-printing"
