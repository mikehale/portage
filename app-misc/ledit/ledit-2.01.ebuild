# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/app-misc/ledit/ledit-2.01.ebuild,v 1.5 2009/08/15 13:02:14 ssuominen Exp $

EAPI=2
inherit eutils

RESTRICT="installsources"
IUSE="+ocamlopt"

DESCRIPTION="A line editor to be used with interactive commands."
SRC_URI="http://pauillac.inria.fr/~ddr/ledit/distrib/src/${P}.tgz"
HOMEPAGE="http://pauillac.inria.fr/~ddr/ledit/"

DEPEND=">=dev-lang/ocaml-3.09[ocamlopt?]
	dev-ml/camlp5"
RDEPEND="${DEPEND}"

SLOT="0"
LICENSE="BSD"
KEYWORDS="amd64 ppc x86 ~x86-fbsd"

src_compile() {
	emake -j1 all || die "make failed"
	if use ocamlopt; then
		emake -j1 ledit.opt || die "make failed"
	else
		# If using bytecode we dont want to strip the binary as it would remove the
		# bytecode and only leave ocamlrun...
		export STRIP_MASK="*/bin/*"
	fi
}

src_install() {
	if use ocamlopt; then
		newbin ledit.opt ledit || die
	else
		newbin ledit.out ledit || die
	fi
	doman ledit.1
	dodoc CHANGES README
}
