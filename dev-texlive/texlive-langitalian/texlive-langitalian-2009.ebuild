# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-texlive/texlive-langitalian/texlive-langitalian-2009.ebuild,v 1.2 2010/02/02 21:20:13 abcd Exp $

TEXLIVE_MODULE_CONTENTS="frontespizio hyphen-italian itnumpar collection-langitalian
"
TEXLIVE_MODULE_DOC_CONTENTS="frontespizio.doc itnumpar.doc "
TEXLIVE_MODULE_SRC_CONTENTS="frontespizio.source itnumpar.source "
inherit texlive-module
DESCRIPTION="TeXLive Italian"

LICENSE="GPL-2 LGPL-2 LPPL-1.3 "
SLOT="0"
KEYWORDS="~alpha ~amd64 ~arm ~hppa ~ia64 ~mips ~ppc ~ppc64 ~s390 ~sh ~sparc ~x86 ~x86-fbsd ~amd64-linux ~x86-linux"
IUSE=""
DEPEND=">=dev-texlive/texlive-basic-2009
"
RDEPEND="${DEPEND} "
