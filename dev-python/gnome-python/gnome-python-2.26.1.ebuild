# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-python/gnome-python/gnome-python-2.26.1.ebuild,v 1.11 2010/07/20 16:38:36 jer Exp $

DESCRIPTION="Meta package which provides python modules for GNOME 2 libraries"
HOMEPAGE="http://pygtk.org/"

LICENSE="LGPL-2.1"
SLOT="2"
KEYWORDS="alpha amd64 arm ia64 ppc ppc64 sh sparc x86 ~x86-fbsd ~x86-freebsd ~x86-interix ~amd64-linux ~x86-linux"
IUSE=""

RDEPEND="~dev-python/gnome-python-base-${PV}
	~dev-python/gconf-python-${PV}
	~dev-python/gnome-vfs-python-${PV}
	~dev-python/libgnomecanvas-python-${PV}
	~dev-python/libbonobo-python-${PV}
	~dev-python/libgnome-python-${PV}"
