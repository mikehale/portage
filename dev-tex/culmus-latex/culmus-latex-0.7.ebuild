# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-tex/culmus-latex/culmus-latex-0.7.ebuild,v 1.14 2009/09/06 20:46:07 ranger Exp $

inherit latex-package

DESCRIPTION="Culmus fonts support for latex"
HOMEPAGE="http://ivritex.sourceforge.net/"
SRC_URI="mirror://sourceforge/ivritex/${P}_src.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="alpha amd64 hppa ia64 ppc ppc64 sparc x86"
IUSE="examples"

RDEPEND="virtual/latex-base"
DEPEND="${RDEPEND}
	media-fonts/culmus
	app-text/t1utils"

src_compile() {
	emake CULMUSDIR=/usr/share/fonts/culmus/ || die "failed to build fonts"
	echo "Map culmus.map" > ${PN}.cfg
}

src_install() {
	emake CULMUSDIR=/usr/share/fonts/culmus/ DESTDIR="${D}" TEXMFROOT=/usr/share/texmf-site pkginstall || die "failed to install"
	insinto /etc/texmf/updmap.d
	doins ${PN}.cfg
	dodoc README
	if use examples ; then
		insinto /usr/share/doc/${PF}/examples
		doins examples/*
		insinto /usr/share/doc/${PF}/examples/hiriq
		doins examples/hiriq/*
	fi
}
