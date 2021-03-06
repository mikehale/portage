# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/www-apps/cgit/cgit-0.8.3.1-r1.ebuild,v 1.3 2010/06/16 16:32:52 ramereth Exp $

EAPI="2"

inherit webapp

GIT_V="1.6.4.3"

DESCRIPTION="a fast web-interface for git repositories"
HOMEPAGE="http://hjemli.net/git/cgit/about/"
SRC_URI="mirror://kernel/software/scm/git/git-${GIT_V}.tar.bz2
	http://hjemli.net/git/cgit/snapshot/${P}.tar.bz2"

LICENSE="GPL-2"
KEYWORDS="~amd64 ~x86"
IUSE="+cgi doc"

RDEPEND="dev-vcs/git
	sys-libs/zlib
	dev-libs/openssl
	cgi? ( virtual/httpd-cgi )"
DEPEND="${RDEPEND}
	doc? ( app-text/docbook-xsl-stylesheets
		>=app-text/asciidoc-8.5.1 )"

src_prepare() {
	rmdir git
	mv "${WORKDIR}"/git-"${GIT_V}" git
}

src_compile() {
	emake || die "emake died"
	if use doc ; then
		emake man-doc || die "emake man-doc died"
	fi
}

src_install() {
	webapp_src_preinst

	mv cgit cgit.cgi
	if use cgi -o use fastcgi ; then
		cp cgit.cgi "${D}"/${MY_CGIBINDIR}
	fi
	insinto ${MY_HTDOCSDIR}
	doins cgit.css cgit.png
	insinto /etc
	doins "${FILESDIR}"/cgitrc
	dodir /var/cache/cgit
	keepdir /var/cache/cgit
	dodoc README
	use doc && doman cgitrc.5

	webapp_postinst_txt en "${FILESDIR}"/postinstall-en.txt
	webapp_src_install
}
