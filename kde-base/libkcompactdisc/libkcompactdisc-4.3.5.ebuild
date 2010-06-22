# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/kde-base/libkcompactdisc/libkcompactdisc-4.3.5.ebuild,v 1.4 2010/06/21 15:53:04 scarabeus Exp $

EAPI="2"

KMNAME="kdemultimedia"
inherit kde4-meta

DESCRIPTION="KDE library for playing & ripping CDs"
KEYWORDS="~alpha amd64 ~ia64 ppc ~ppc64 ~sparc x86 ~amd64-linux ~x86-linux"
IUSE="alsa debug"

src_configure() {
	mycmakeargs=(
		$(cmake-utils_use_with alsa)
	)
	kde4-meta_src_configure
}
