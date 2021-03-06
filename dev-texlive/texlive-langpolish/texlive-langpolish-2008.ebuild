# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-texlive/texlive-langpolish/texlive-langpolish-2008.ebuild,v 1.12 2010/01/15 10:30:32 grobian Exp $

TEXLIVE_MODULE_CONTENTS="cc-pl gustlib mex mwcls ogonek pl polski qpxqtx tap utf8mex bin-mex hyphen-polish collection-langpolish
"
TEXLIVE_MODULE_DOC_CONTENTS="cc-pl.doc gustlib.doc mex.doc mwcls.doc ogonek.doc pl.doc polski.doc qpxqtx.doc tap.doc utf8mex.doc "
TEXLIVE_MODULE_SRC_CONTENTS="mex.source mwcls.source ogonek.source polski.source tap.source "
inherit texlive-module
DESCRIPTION="TeXLive Polish"

LICENSE="GPL-2 as-is freedist LPPL-1.3 public-domain "
SLOT="0"
KEYWORDS="alpha amd64 arm hppa ia64 ~mips ppc ppc64 s390 sh sparc x86 ~x86-fbsd ~amd64-linux ~x86-linux ~ppc-macos ~x86-macos ~sparc-solaris ~x86-solaris"
IUSE=""
DEPEND=">=dev-texlive/texlive-latex-2008
"
RDEPEND="${DEPEND}"
