# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-vcs/qbzr/qbzr-0.19.ebuild,v 1.1 2010/08/10 12:33:17 fauli Exp $

EAPI="3"
PYTHON_DEPEND="2"
SUPPORT_PYTHON_ABIS="1"
RESTRICT_PYTHON_ABIS="3.*"

inherit distutils

DESCRIPTION="Qt frontend for Bazaar"
HOMEPAGE="https://launchpad.net/qbzr"
SRC_URI="https://edge.launchpad.net/qbzr/${PV}/${PV}/+download/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~sparc ~x86"
IUSE=""

# bzr version comes from NEWS file. It's lowest version required for some
# features to work.
DEPEND=">=dev-vcs/bzr-1.14
		>=dev-python/PyQt4-4.1[X]"
RDEPEND="${DEPEND}"

S="${WORKDIR}/${PN}"

DOCS="AUTHORS.txt NEWS.txt README.txt TODO.txt"
PYTHON_MODNAME="bzrlib/plugins/qbzr"

src_test() {
	elog "It's impossible to run tests at this point. If you wish to run tests"
	elog "after installation of ${PN} execute:"
	elog " $ bzr selftest -s bzrlib.plugins.qbzr"
}

pkg_postinst() {
	distutils_pkg_postinst

	elog
	elog "To enable spellchecking in qcommit, please, install >=dev-python/pyenchant-1.5.0"
	elog " # emerge -a >=dev-python/pyenchant-1.5.0"
	elog "To enable syntax highlighting, please, install dev-python/pygments"
	elog " # emerge -a dev-python/pygments"
}
