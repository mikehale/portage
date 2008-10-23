# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/app-editors/jove/jove-4.16.0.70.3.1.ebuild,v 1.2 2008/10/21 21:53:09 ulm Exp $

inherit eutils flag-o-matic versionator

MY_P=${PN}_$(get_version_component_range 1-4)
MY_DIFFP=${MY_P}-$(get_version_component_range 5-6)
DESCRIPTION="Jonathan's Own Version of Emacs - a light emacs-like editor without LISP bindings"
HOMEPAGE="ftp://ftp.cs.toronto.edu/cs/ftp/pub/hugh/jove-dev/"
SRC_URI="mirror://debian/pool/main/j/${PN}/${MY_P}.orig.tar.gz
	mirror://debian/pool/main/j/${PN}/${MY_DIFFP}.diff.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~x86"
IUSE="X unix98"

RDEPEND="sys-libs/ncurses
	X? ( x11-libs/xview )"

DEPEND="${RDEPEND}
	>=sys-apps/sed-4"

S="${WORKDIR}/${MY_P/_/}"

src_unpack() {
	unpack ${A}
	cd "${S}"
	epatch "${WORKDIR}/${MY_DIFFP}.diff"

	sed -i \
		-e "s:-ltermcap:-lncurses:" \
		-e "s:^OPTFLAGS =.*:OPTFLAGS = ${CFLAGS}:" \
		Makefile
}

src_compile() {
	if use unix98 ; then
		emake SYSDEFS="-DSYSVR4 -D_XOPEN_SOURCE=500" || die
	else
		emake || die
	fi

	if use X ; then
		emake XJOVEHOME=/usr makexjove || die
	fi
}

src_install() {
	emake DESTDIR="${D}" install || die

	if use X ; then
		make DESTDIR="${D}" \
			XJOVEHOME="${D}"/usr \
			MANDIR="${D}"/usr/share/man/man1 \
			installxjove || die
	fi

	keepdir /var/lib/jove/preserve
}