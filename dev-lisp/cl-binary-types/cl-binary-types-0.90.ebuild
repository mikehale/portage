# Copyright 1999-2005 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-lisp/cl-binary-types/cl-binary-types-0.90.ebuild,v 1.7 2005/05/24 18:48:32 mkennedy Exp $

inherit common-lisp eutils

# binary-types moved to http://www.common-lisp.net/project/movitz recently

DESCRIPTION="Binary-types is a Library for accessing binary files with fixed bit-length code-words."
HOMEPAGE="http://www.cliki.net/Binary-types http://www.common-lisp.net/project/movitz/ http://www.cs.uit.no/~frodef/sw/binary-types/"
SRC_URI="http://www.cs.uit.no/~frodef/sw/binary-types/binary-types-0.90.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~sparc x86"
IUSE=""

DEPEND="dev-lisp/common-lisp-controller
	virtual/commonlisp"

CLPACKAGE=binary-types

S=${WORKDIR}/binary-types-${PV}

src_unpack() {
	unpack ${A}
	cd ${S}
	epatch ${FILESDIR}/${PV}-gentoo.patch
}

src_install() {
	common-lisp-install ${FILESDIR}/binary-types.asd *.lisp
	common-lisp-system-symlink
	dodoc example.lisp README-bitfield ChangeLog COPYING README type-hierarchy.{ps,png} example.lisp
}
