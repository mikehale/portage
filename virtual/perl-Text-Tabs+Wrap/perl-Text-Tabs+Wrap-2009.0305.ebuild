# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/virtual/perl-Text-Tabs+Wrap/perl-Text-Tabs+Wrap-2009.0305.ebuild,v 1.2 2009/08/25 10:57:00 tove Exp $

DESCRIPTION="Virtual for Text-Tabs+Wrap"
HOMEPAGE="http://www.gentoo.org/proj/en/perl/"
SRC_URI=""

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~alpha ~amd64 ~ia64 ~ppc ~ppc64 ~sparc ~x86 ~x86-fbsd"
IUSE=""

DEPEND=""
RDEPEND="|| ( ~dev-lang/perl-5.10.1 ~perl-core/Text-Tabs+Wrap-${PV} )"
