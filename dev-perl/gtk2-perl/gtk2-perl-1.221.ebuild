# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-perl/gtk2-perl/gtk2-perl-1.221.ebuild,v 1.3 2010/05/29 19:18:38 armin76 Exp $

EAPI=2

MODULE_AUTHOR=TSCH
MY_PN=Gtk2
MY_P=${MY_PN}-${PV}
S=${WORKDIR}/${MY_P}

inherit perl-module
#inherit virtualx

DESCRIPTION="Perl bindings for GTK2"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="~alpha ~ia64 ~sparc ~x86 ~amd64-linux ~x86-linux ~x86-solaris"
IUSE=""

RDEPEND=">=x11-libs/gtk+-2
	dev-perl/Cairo
	>=dev-perl/glib-perl-1.220
	>=dev-perl/Pango-1.220"
DEPEND="${RDEPEND}
	>=dev-perl/extutils-depends-0.300
	>=dev-perl/extutils-pkgconfig-1.030"
#SRC_TEST=do
#src_test(){
#	Xmake test || die
#}
