# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-php5/symfony/symfony-1.4.3.ebuild,v 1.5 2010/04/15 21:50:48 maekke Exp $

EAPI=2
inherit php-pear-lib-r1 depend.php

DESCRIPTION="Open-source PHP5 professional web framework"
HOMEPAGE="http://www.symfony-project.com/"
SRC_URI="http://pear.symfony-project.com/get/${P}.tgz"

LICENSE="MIT LGPL-2.1 BSD BSD-2 FDL-1.2"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

DEPEND="dev-lang/php:5[cli,ctype,pcre,reflection,session,simplexml,spl,tokenizer,xml]
	dev-php/pear"
RDEPEND="${DEPEND}"
