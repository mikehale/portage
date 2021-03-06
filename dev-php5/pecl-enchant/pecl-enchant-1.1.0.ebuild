# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-php5/pecl-enchant/pecl-enchant-1.1.0.ebuild,v 1.1 2010/07/04 22:50:37 mabi Exp $

PHP_EXT_NAME="enchant"
PHP_EXT_INI="yes"
PHP_EXT_ZENDEXT="no"
DOCS="docs/examples/example1.php"

inherit php-ext-pecl-r1

KEYWORDS="~amd64 ~x86"

DESCRIPTION="PHP bindings for the Enchant spellchecking wrapper library."
LICENSE="PHP-3"
SLOT="0"
IUSE=""

DEPEND=">=app-text/enchant-1.1.3"
RDEPEND="${DEPEND}"

need_php_by_category

src_compile() {
	my_conf="--with-enchant=/usr"
	php-ext-pecl-r1_src_compile
}
