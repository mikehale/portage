# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/app-portage/gentoolkit/gentoolkit-0.3.0_rc9.ebuild,v 1.2 2010/04/01 17:15:43 armin76 Exp $

EAPI="2"
SUPPORT_PYTHON_ABIS="1"

inherit distutils

DESCRIPTION="Collection of administration scripts for Gentoo"
HOMEPAGE="http://www.gentoo.org/proj/en/portage/tools/index.xml"
SRC_URI="mirror://gentoo/${P}.tar.gz http://dev.gentoo.org/~fuzzyray/distfiles/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
IUSE=""

# Drop ~m68k ~s390 ~sh ~sparc-fbsd ~x86-fbsd due to app-misc/realpath dependency
KEYWORDS="~alpha ~amd64 ~arm ~hppa ~ia64 ~m68k ~mips ~ppc ~ppc64 ~s390 ~sh ~sparc ~x86"

DEPEND="sys-apps/portage
	dev-lang/python[xml]
	dev-lang/perl
	sys-apps/grep
	sys-apps/gawk"
RDEPEND="${DEPEND}
	app-misc/realpath"
RESTRICT_PYTHON_ABIS="3.*"

distutils_src_compile_pre_hook() {
	echo VERSION="$PVR" "$(PYTHON)" setup.py set_version
	VERSION="$PVR" "$(PYTHON)" setup.py set_version
}

src_install() {
	distutils_src_install

	# Create cache directory for revdep-rebuild
	dodir /var/cache/revdep-rebuild
	keepdir /var/cache/revdep-rebuild
	fowners root:root /var/cache/revdep-rebuild
	fperms 0700 /var/cache/revdep-rebuild

	# Can distutils handle this?
	dosym eclean-$(PYTHON --ABI -f) /usr/bin/eclean-dist
	dosym eclean-$(PYTHON --ABI -f) /usr/bin/eclean-pkg
}

pkg_postinst() {
	distutils_pkg_postinst

	# Make sure that our ownership and permissions stuck
	chown root:root "${ROOT}/var/cache/revdep-rebuild"
	chmod 0700 "${ROOT}/var/cache/revdep-rebuild"

	einfo
	elog "The default location for revdep-rebuild files has been moved"
	elog "to /var/cache/revdep-rebuild when run as root."
	einfo
	einfo "Another alternative to equery is app-portage/portage-utils"
	einfo
	einfo "For further information on gentoolkit, please read the gentoolkit"
	einfo "guide: http://www.gentoo.org/doc/en/gentoolkit.xml"
	einfo
	ewarn "This version of gentoolkit contains a rewritten version of equery"
	ewarn "and the gentoolkit library.  Because of this, the documentation is"
	ewarn "out of date.  Please check http://bugs.gentoo.org/269071 when"
	ewarn "filing bugs to see if your issue is being addressed."
	ewarn
	ewarn "glsa-check since gentoolkit 0.3 has modified some output,"
	ewarn "options and default behavior. The list of injected GLSAs"
	ewarn "has moved to /var/lib/portage/glsa_injected, please"
	ewarn "run 'glsa-check -p affected' before copying the existing checkfile."
}
