# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-haskell/http/http-4000.0.8.ebuild,v 1.3 2010/07/01 19:57:11 jer Exp $

CABAL_FEATURES="lib profile haddock"
inherit haskell-cabal

MY_PN="HTTP"
MY_P="${MY_PN}-${PV}"

DESCRIPTION="A library for client-side HTTP"
HOMEPAGE="http://projects.haskell.org/http/"
SRC_URI="http://hackage.haskell.org/packages/archive/${MY_PN}/${PV}/${MY_P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~ppc64 ~sparc ~x86 ~ppc-macos ~x86-macos"
IUSE=""

RDEPEND=">=dev-lang/ghc-6.6.1
		dev-haskell/mtl
		dev-haskell/network
		dev-haskell/parsec"

DEPEND="${RDEPEND}
		>=dev-haskell/cabal-1.2"

S="${WORKDIR}/${MY_P}"
