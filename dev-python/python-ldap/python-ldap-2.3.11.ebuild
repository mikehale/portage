# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-python/python-ldap/python-ldap-2.3.11.ebuild,v 1.9 2010/08/16 18:36:02 grobian Exp $

EAPI="3"
PYTHON_DEPEND="2"
SUPPORT_PYTHON_ABIS="1"

inherit distutils eutils multilib

DOC_P="${PN}-docs-html-2.3.7"

DESCRIPTION="Various LDAP-related Python modules"
HOMEPAGE="http://python-ldap.sourceforge.net/ http://pypi.python.org/pypi/python-ldap"
SRC_URI="http://pypi.python.org/packages/source/p/python-ldap/${P}.tar.gz
	doc? ( http://www.python-ldap.org/doc/${DOC_P}.tar.gz )"

LICENSE="PYTHON"
SLOT="0"
KEYWORDS="alpha amd64 hppa ia64 ppc ppc64 sparc x86 ~x86-solaris"
IUSE="doc examples sasl ssl"

RDEPEND=">=net-nds/openldap-2.4
	sasl? ( dev-libs/cyrus-sasl )"
DEPEND="${DEPEND}
	dev-python/setuptools"
RESTRICT_PYTHON_ABIS="3.*"

DOCS="CHANGES README"
PYTHON_MODNAME="dsml.py ldapurl.py ldif.py ldap"

src_prepare() {
	local rpath=
	# sloppy logic, maybe better check if compiler links with GNU-ld
	[[ ${CHOST} != *-darwin* ]] && rpath="-Wl,-rpath=${EPREFIX}/usr/$(get_libdir)/sasl2"
	# Note: we can't add /usr/lib and /usr/lib/sasl2 to library_dirs due to a bug in py2.4
	sed -e "s:^library_dirs =.*:library_dirs =:" \
		-e "s:^include_dirs =.*:include_dirs = ${EPREFIX}/usr/include ${EPREFIX}/usr/include/sasl:" \
		-e "s:\(extra_compile_args =\).*:\1\nextra_link_args = ${rpath}:" \
		-i setup.cfg || die "error fixing setup.cfg"

	local mylibs="ldap"
	if use sasl; then
		use ssl && mylibs="ldap_r"
		mylibs="${mylibs} sasl2"
	fi
	use ssl && mylibs="${mylibs} ssl crypto"

	sed -e "s:^libs = .*:libs = lber resolv ${mylibs}:" \
		-e "s:^compile.*:compile = 0:" \
		-e "s:^optimize.*:optimize = 0:" \
		-i setup.cfg || die "error setting up libs in setup.cfg"
}

src_install() {
	distutils_src_install

	use doc && dohtml -r "${WORKDIR}/${DOC_P}"/*
	if use examples; then
		insinto /usr/share/doc/${PF}
		doins -r Demo
	fi
}
