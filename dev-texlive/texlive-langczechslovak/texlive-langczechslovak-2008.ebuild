# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-texlive/texlive-langczechslovak/texlive-langczechslovak-2008.ebuild,v 1.11 2009/06/10 14:10:13 alexxy Exp $

TEXLIVE_MODULE_CONTENTS="cs csbulletin cslatex csplain bin-cslatex bin-csplain bin-vlna hyphen-czech hyphen-slovak collection-langczechslovak
"
TEXLIVE_MODULE_DOC_CONTENTS="csbulletin.doc cslatex.doc bin-vlna.doc "
TEXLIVE_MODULE_SRC_CONTENTS="cslatex.source "
inherit texlive-module
DESCRIPTION="TeXLive Czech/Slovak"

LICENSE="GPL-2 as-is GPL-1 LPPL-1.3 "
SLOT="0"
KEYWORDS="alpha amd64 arm hppa ia64 ~mips ppc ppc64 s390 sh sparc x86 ~x86-fbsd"
IUSE=""
DEPEND=">=dev-texlive/texlive-basic-2008
>=dev-texlive/texlive-latex-2008
"
RDEPEND="${DEPEND}"
