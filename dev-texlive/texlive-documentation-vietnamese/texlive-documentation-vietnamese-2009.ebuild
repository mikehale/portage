# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-texlive/texlive-documentation-vietnamese/texlive-documentation-vietnamese-2009.ebuild,v 1.2 2010/02/02 21:36:34 abcd Exp $

TEXLIVE_MODULE_CONTENTS="amsldoc-vn lshort-vietnamese ntheorem-vn collection-documentation-vietnamese
"
TEXLIVE_MODULE_DOC_CONTENTS="amsldoc-vn.doc lshort-vietnamese.doc ntheorem-vn.doc "
TEXLIVE_MODULE_SRC_CONTENTS=""
inherit texlive-module
DESCRIPTION="TeXLive Vietnamese documentation"

LICENSE="GPL-2 LGPL-2 LPPL-1.3 "
SLOT="0"
KEYWORDS="~alpha ~amd64 ~arm ~hppa ~ia64 ~mips ~ppc ~ppc64 ~s390 ~sh ~sparc ~x86 ~x86-fbsd ~amd64-linux ~x86-linux"
IUSE=""
DEPEND=">=dev-texlive/texlive-documentation-base-2009
"
RDEPEND="${DEPEND} "
