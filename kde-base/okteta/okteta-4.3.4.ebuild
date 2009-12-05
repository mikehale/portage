# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/kde-base/okteta/okteta-4.3.4.ebuild,v 1.2 2009/12/05 05:15:13 abcd Exp $

EAPI="2"

KMNAME="kdeutils"
inherit kde4-meta

DESCRIPTION="KDE hexeditor"
KEYWORDS="~alpha ~amd64 ~hppa ~ia64 ~ppc ~ppc64 ~sparc ~x86"
IUSE="debug +handbook"

DEPEND="
	app-crypt/qca:2
"
RDEPEND="${DEPEND}"

# Tests hang, last checked in 4.3.3
RESTRICT="test"
