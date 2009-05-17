# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-tex/glossaries/glossaries-1.14.ebuild,v 1.3 2009/05/16 14:27:03 ulm Exp $

inherit latex-package

DESCRIPTION="Create glossaries and lists of acronyms."
HOMEPAGE="http://www.ctan.org/tex-archive/help/Catalogue/entries/glossaries.html"
SRC_URI="mirror://gentoo/${P}.zip"

# Taken from :
# ftp://tug.ctan.org/tex-archive/macros/latex/contrib/${PN}.zip"

LICENSE="LPPL-1.2"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~x86-fbsd"
IUSE="doc examples"

RDEPEND="dev-lang/perl
	dev-texlive/texlive-latexrecommended
	dev-texlive/texlive-latexextra"
DEPEND="${RDEPEND}
	app-arch/unzip"

TEXMF="/usr/share/texmf-site"
S=${WORKDIR}/${PN}

src_install() {
	latex-package_src_doinstall styles

	dobin makeglossaries

	dodoc CHANGES README
	insinto "${TEXMF}/tex/latex/${PN}/dict"
	doins *.dict
	if use doc ; then
		latex-package_src_doinstall pdf
	fi
	if use examples ; then
		insinto /usr/share/doc/${PF}/examples
		doins *.tex
	fi
}
