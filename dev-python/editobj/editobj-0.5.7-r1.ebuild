# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-python/editobj/editobj-0.5.7-r1.ebuild,v 1.3 2010/04/26 10:50:42 fauli Exp $

EAPI="3"
PYTHON_DEPEND="2"
PYTHON_USE_WITH="tk"
SUPPORT_PYTHON_ABIS="1"

inherit distutils

MY_P="${P/editobj/EditObj}"

DESCRIPTION="EditObj can create a dialog box to edit ANY Python object."
SRC_URI="http://download.gna.org/songwrite/${MY_P}.tar.gz"
HOMEPAGE="http://home.gna.org/oomadness/en/editobj/index.html"

LICENSE="GPL-2"
KEYWORDS="~amd64 ~ia64 ~ppc x86"
SLOT="0"
IUSE=""

DEPEND=""
RDEPEND=""
RESTRICT_PYTHON_ABIS="3.*"

S="${WORKDIR}/${MY_P}"

src_install() {
	distutils_src_install

	insinto /usr/share/doc/${PF}
	doins -r demo
}
