# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/x11-themes/nitrogen/nitrogen-3.3.2.ebuild,v 1.1 2010/01/27 14:47:29 ssuominen Exp $

EAPI=2
KDE_LINGUAS="de pl"
inherit kde4-base

MY_P=kde4-windeco-${P}-Source

DESCRIPTION="A window decoration for KDE4"
HOMEPAGE="http://kde-look.org/content/show.php/Nitrogen?content=99551"
SRC_URI="http://www.kde-look.org/CONTENT/content-files/99551-${MY_P}.tar.gz"

LICENSE="GPL-2"
SLOT="4"
KEYWORDS="~amd64 ~x86"
IUSE="debug"

DEPEND=">=kde-base/kwin-${KDE_MINIMAL}"

S=${WORKDIR}/${MY_P}

DOCS="README"
