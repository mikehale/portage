# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-python/gnome-python-extras/gnome-python-extras-2.25.3.ebuild,v 1.6 2010/08/01 10:39:11 fauli Exp $

DESCRIPTION="Meta build which provides python interfacing modules for some GNOME libraries"
HOMEPAGE="http://pygtk.org/"

LICENSE="LGPL-2.1 GPL-2"
SLOT="0"
KEYWORDS="~alpha amd64 ~ia64 ~ppc ~ppc64 ~sparc x86 ~x86-fbsd"
IUSE="libgda xulrunner"

RDEPEND="=dev-python/egg-python-${PV}*
	=dev-python/gdl-python-${PV}*
	=dev-python/gtkhtml-python-${PV}*
	xulrunner? ( =dev-python/gtkmozembed-python-${PV}* )
	=dev-python/gtkspell-python-${PV}*
	=dev-python/libgksu-python-${PV}*
	libgda? ( =dev-python/libgda-python-${PV}* )"
