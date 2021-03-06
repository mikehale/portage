# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-vcs/tig/tig-0.14.1.ebuild,v 1.1 2010/06/15 16:07:36 jlec Exp $

inherit bash-completion

DESCRIPTION="Tig: text mode interface for git"
HOMEPAGE="http://jonas.nitro.dk/tig/"
SRC_URI="http://jonas.nitro.dk/tig/releases/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~alpha amd64 ~arm ~hppa ~ia64 ~mips ~ppc ~ppc64 ~s390 ~sh ~sparc x86 ~x86-fbsd"
IUSE=""

DEPEND="sys-libs/ncurses"
RDEPEND="${DEPEND}
		dev-vcs/git"

src_compile() {
	econf CFLAGS="${CFLAGS}" || die "econf failed"
	emake CFLAGS="${CFLAGS}" || die "emake failed"
}

src_install() {
	einstall || die "einstall failed"
	doman tig.1 tigrc.5
	dodoc manual.txt
	dohtml manual.html
	dobashcompletion contrib/tig-completion.bash
}
