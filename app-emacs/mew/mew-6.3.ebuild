# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/app-emacs/mew/mew-6.3.ebuild,v 1.1 2010/04/12 18:07:37 fauli Exp $

inherit elisp

DESCRIPTION="Great MIME mail reader for Emacs/XEmacs"
HOMEPAGE="http://www.mew.org/"
SRC_URI="http://www.mew.org/Release/${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~alpha ~amd64 ~ppc ~sparc ~x86"
IUSE="ssl linguas_ja"
RESTRICT="test"

RDEPEND="ssl? ( net-misc/stunnel )"

SITEFILE="50${PN}-gentoo.el"

src_compile() {
	econf \
		--with-elispdir=${SITELISP}/${PN} \
		--with-etcdir=${SITEETC}/${PN}
	emake || die

	if use linguas_ja; then
		emake jinfo || die
	fi
}

src_install() {
	emake DESTDIR="${D}" install || die

	if use linguas_ja; then
		emake DESTDIR="${D}" install-jinfo || die
	fi

	elisp-site-file-install "${FILESDIR}/${SITEFILE}" || die
	dodoc 00api 00changes* 00diff 00readme mew.dot.* || die
}

pkg_postinst() {
	elisp-site-regen
	elog "Please refer to /usr/share/doc/${PF} for sample configuration files."
}
