# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/x11-themes/fvwm_sounds/fvwm_sounds-1.0.ebuild,v 1.18 2010/02/24 14:52:43 ssuominen Exp $

S=${WORKDIR}
DESCRIPTION="Sounds for use with FVWM"
SRC_URI="http://www.fvwm.org/generated/sounds_download/fvwm_sounds.tgz"
HOMEPAGE="http://www.fvwm.org/"
IUSE=""
DEPEND="x11-wm/fvwm"
KEYWORDS="alpha amd64 ia64 ppc ppc64 sparc x86"
SLOT="0"
LICENSE="GPL-2 FVWM"

src_install () {
	dodir /usr/share/sounds/fvwm
	insinto /usr/share/sounds/fvwm
	doins "${S}"/*
}
