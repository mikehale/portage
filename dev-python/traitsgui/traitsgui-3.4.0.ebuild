# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-python/traitsgui/traitsgui-3.4.0.ebuild,v 1.3 2010/07/04 07:07:57 arfrever Exp $

EAPI="3"
PYTHON_DEPEND="2"
SUPPORT_PYTHON_ABIS="1"
RESTRICT_PYTHON_ABIS="3.*"

inherit distutils

MY_PN="TraitsGUI"
MY_P="${MY_PN}-${PV}"

DESCRIPTION="Traits-capable windowing framework"
HOMEPAGE="http://code.enthought.com/projects/traits_gui http://pypi.python.org/pypi/TraitsGUI"
SRC_URI="http://www.enthought.com/repo/ETS/${MY_P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="doc examples qt4 wxwidgets"

RDEPEND=">=dev-python/enthoughtbase-3.0.5
	>=dev-python/traits-${PV}
	qt4? ( >=dev-python/traitsbackendqt-${PV} )
	wxwidgets? ( >=dev-python/traitsbackendwx-${PV} )
	!wxwidgets? ( !qt4? ( >=dev-python/traitsbackendwx-${PV} ) )"
DEPEND="dev-python/setuptools"

S="${WORKDIR}/${MY_P}"

PYTHON_MODNAME="enthought"

src_prepare() {
	sed -i \
		-e "s/self.run_command('build_docs')/pass/" \
		-e "s/setupdocs>=1.0//" \
		setup.py || die
}

src_install() {
	find "${S}" -name \*LICENSE.txt -delete
	distutils_src_install
	dodoc docs/*.txt
	insinto /usr/share/doc/${PF}
	if use doc; then
		doins -r docs/*.pdf || die
	fi
	if use examples; then
		doins -r examples || die
	fi
}
