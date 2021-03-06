# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-haskell/hslogger/hslogger-1.0.1.ebuild,v 1.3 2007/07/27 23:46:43 dcoutts Exp $

CABAL_FEATURES="lib profile haddock"
inherit haskell-cabal

DESCRIPTION="A logging framework for Haskell"
HOMEPAGE="http://software.complete.org/hslogger"
SRC_URI="http://software.complete.org/hslogger/static/download_area/${PV}/${PN}_${PV}.tar.gz"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

DEPEND=">=dev-lang/ghc-6.4.1
		dev-haskell/mtl
		dev-haskell/network"

S="${WORKDIR}/${PN}"
