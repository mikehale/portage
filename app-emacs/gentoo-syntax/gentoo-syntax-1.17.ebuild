# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/app-emacs/gentoo-syntax/gentoo-syntax-1.17.ebuild,v 1.5 2010/08/29 18:17:35 armin76 Exp $

inherit elisp

DESCRIPTION="Emacs modes for editing ebuilds and other Gentoo specific files"
HOMEPAGE="http://www.gentoo.org/proj/en/lisp/emacs/"
SRC_URI="mirror://gentoo/${P}.tar.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="alpha amd64 ~hppa ia64 ppc ppc64 sparc x86 ~sparc-fbsd ~x86-fbsd ~x86-freebsd ~amd64-linux ~x86-linux ~x86-macos"
IUSE=""

DOCS="ChangeLog"
SITEFILE="50${PN}-gentoo.el"

src_compile() {
	elisp_src_compile
	makeinfo gentoo-syntax.texi || die
}

src_install() {
	elisp-install ${PN} *.el *.elc || die
	sed -e "s:@PORTDIR@:${PORTDIR}:" \
		"${FILESDIR}/${SITEFILE}" >"${T}/${SITEFILE}" || die
	elisp-site-file-install "${T}/${SITEFILE}" || die
	doinfo gentoo-syntax.info || die
	dodoc ${DOCS} || die
}

pkg_postinst() {
	elisp-site-regen

	elog "Some optional features may require installation of additional"
	elog "packages, like app-portage/gentoolkit-dev for echangelog."
}
