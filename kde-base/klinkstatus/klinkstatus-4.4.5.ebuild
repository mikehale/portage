# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/kde-base/klinkstatus/klinkstatus-4.4.5.ebuild,v 1.6 2010/08/09 17:35:10 scarabeus Exp $

EAPI="3"
KMNAME="kdewebdev"
inherit kde4-meta

DESCRIPTION="KDE web development - link validity checker"
KEYWORDS="amd64 ppc ~ppc64 x86 ~amd64-linux ~x86-linux"
IUSE="debug +handbook tidy"

DEPEND="
	$(add_kdebase_dep kdepimlibs 'semantic-desktop')
	tidy? ( app-text/htmltidy )
"
RDEPEND="${DEPEND}"

src_configure() {
	mycmakeargs=(
		-DWITH_KdepimLibs=ON
		$(cmake-utils_use_with tidy LibTidy)
	)

	kde4-meta_src_configure
}

pkg_postinst() {
	kde4-meta_pkg_postinst

	echo
	elog "To use scripting in ${PN}, install dev-lang/ruby."
	echo
}
