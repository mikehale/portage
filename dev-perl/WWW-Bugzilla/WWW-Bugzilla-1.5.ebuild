# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-perl/WWW-Bugzilla/WWW-Bugzilla-1.5.ebuild,v 1.1 2009/10/12 20:29:44 tove Exp $

EAPI=2

MODULE_AUTHOR=BMC
inherit perl-module

DESCRIPTION="WWW::Bugzilla - automate interaction with bugzilla"

SLOT="0"
KEYWORDS="~amd64 ~ppc ~sparc ~x86"
IUSE=""

RDEPEND="dev-perl/WWW-Mechanize
	>=dev-perl/Params-Validate-0.88
	>=dev-perl/Crypt-SSLeay-0.57
	dev-perl/Class-MethodMaker"
DEPEND="${RDEPEND}"

src_prepare() {
	perl-module_src_prepare
	mkdir "${S}"/lib
	cp -r "${S}"/{WWW,lib}
}
