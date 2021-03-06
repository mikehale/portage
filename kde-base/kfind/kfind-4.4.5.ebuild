# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/kde-base/kfind/kfind-4.4.5.ebuild,v 1.5 2010/08/09 17:34:50 scarabeus Exp $
EAPI="3"

KMNAME="kdebase-apps"
inherit kde4-meta

DESCRIPTION="KDE file finder utility"
KEYWORDS="amd64 ~arm ppc ~ppc64 x86 ~amd64-linux ~x86-linux"
IUSE="debug +handbook"

DEPEND="
	$(add_kdebase_dep libkonq)
"
RDEPEND="${DEPEND}"
