# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-php5/symfony/symfony-1.4.6.ebuild,v 1.1 2010/07/12 17:55:18 mabi Exp $

EAPI=2
inherit php-pear-lib-r1

DESCRIPTION="Open-source PHP5 professional web framework"
HOMEPAGE="http://www.symfony-project.com/"
SRC_URI="http://pear.symfony-project.com/get/${P}.tgz"

LICENSE="MIT LGPL-2.1 BSD BSD-2 FDL-1.2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="dev-lang/php:5[cli,ctype,session,simplexml,tokenizer,xml]
		|| ( <dev-lang/php-5.3[pcre,reflection,spl] >=dev-lang/php-5.3 )
		dev-php/pear"
RDEPEND="${DEPEND}"

pkg_postinst() {
	if has_version '=dev-lang/php-5*[-posix]';then
		einfo ""
		einfo "To enable color output on the symfony command line"
		einfo "add USE=\"posix\" to dev-lang/php"
		einfo ""
	fi
}
