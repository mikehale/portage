# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-vcs/bzr-svn/bzr-svn-1.0.2.ebuild,v 1.3 2010/07/27 21:06:46 fauli Exp $

EAPI="3"
PYTHON_DEPEND="2"
SUPPORT_PYTHON_ABIS="1"
RESTRICT_PYTHON_ABIS="3.*"

inherit distutils

MY_P=${P/_rc/~rc}

DESCRIPTION="Bazaar plugin that adds support for foreign Subversion repositories."
HOMEPAGE="http://bazaar-vcs.org/BzrForeignBranches/Subversion"
SRC_URI="http://samba.org/~jelmer/bzr/${MY_P}.tar.gz"

LICENSE="|| ( GPL-2 GPL-3 )"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"
# As long as https://bugs.launchpad.net/bzr-svn/+bug/526485 is unfixed
RESTRICT=test

# Packager: check compatible bzr versions via
# `grep bzr_compatible_versions info.py`, and minimum subvertpy version
# via `grep subvertpy_minimum_version info.py`.

CDEPEND=">=dev-vcs/bzr-1.16
	>=dev-lang/python-2.5[sqlite]
	>=dev-python/subvertpy-0.6.1"
DEPEND="${CDEPEND}
	test? ( !dev-vcs/bzr-rebase )"
RDEPEND="${CDEPEND}"

S=${WORKDIR}/${MY_P}

DOCS="AUTHORS FAQ HACKING NEWS README TODO UPGRADING mapping.txt specs/*"
