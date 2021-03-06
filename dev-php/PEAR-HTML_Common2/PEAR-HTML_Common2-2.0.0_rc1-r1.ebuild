# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-php/PEAR-HTML_Common2/PEAR-HTML_Common2-2.0.0_rc1-r1.ebuild,v 1.1 2010/03/23 16:52:59 beandog Exp $

# Source file is uppercase RC, bug 305745
PEAR_PV="${PV/_rc/RC}"
inherit php-pear-r1

DESCRIPTION="Abstract base class for HTML classes (PHP5 port of PEAR-HTML_Common package)."
LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=">=dev-lang/php-5.1.4"
