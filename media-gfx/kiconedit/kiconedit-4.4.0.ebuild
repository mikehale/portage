# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/media-gfx/kiconedit/kiconedit-4.4.0.ebuild,v 1.1 2010/02/21 16:12:29 ssuominen Exp $

EAPI=2
KDE_MINIMAL=4.4
KDE_LINGUAS="af ar be bg br ca ca@valencia cs cy da de el en_GB eo es et eu fa
fi fr ga gl he hi hne hr hu is it ja km ko lt lv mai mk ms nb nds ne nl nn oc pa
pl pt pt_BR ro ru se sk sl sv ta tg th tr uk vi wa xh zh_CN zh_HK zh_TW"
KDE_DOC_DIRS="doc doc-translations/%lingua_${PN}"
inherit kde4-base

DESCRIPTION="KDE Icon Editor"
HOMEPAGE="http://www.kde.org/"
SRC_URI="mirror://kde/stable/${PV}/src/extragear/${P}.tar.bz2"

LICENSE="GPL-2 FDL-1.2"
SLOT="4"
KEYWORDS="~amd64 ~x86"
IUSE="debug +handbook"
