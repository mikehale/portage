# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/kde-base/ksmserver/ksmserver-4.4.5.ebuild,v 1.5 2010/08/09 17:34:54 scarabeus Exp $

EAPI="3"

KMNAME="kdebase-workspace"
inherit kde4-meta

DESCRIPTION="The reliable KDE session manager that talks the standard X11R6"
KEYWORDS="amd64 ~arm ppc ~ppc64 x86 ~amd64-linux ~x86-linux"
IUSE="debug"

DEPEND="
	$(add_kdebase_dep kcminit)
	$(add_kdebase_dep libkworkspace)
	$(add_kdebase_dep solid)
"
RDEPEND="${DEPEND}"

KMEXTRACTONLY="
	kcminit/main.h
	libs/kworkspace/
	solid/
"

KMLOADLIBS="libkworkspace"
