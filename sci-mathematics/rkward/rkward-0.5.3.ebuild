# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/sci-mathematics/rkward/rkward-0.5.3.ebuild,v 1.3 2010/07/01 14:34:48 hwoarang Exp $

EAPI="2"

inherit kde4-base

DESCRIPTION="An IDE/GUI for the R-project"
HOMEPAGE="http://rkward.sourceforge.net/"
SRC_URI="mirror://sourceforge/rkward/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE="debug"

DEPEND=">=dev-lang/R-2.7.0"
RDEPEND="${DEPEND}
	!<=sci-mathematics/rkward-0.5.0b"

src_install() {
	kde4-base_src_install
	# avoid file collisions
	rm -f "${D}"/usr/$(get_libdir)/R/library/R.css
	rm -f "${D}"/usr/share/apps/katepart/syntax/r.xml
}
