# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/net-analyzer/nessus/nessus-2.3.1.ebuild,v 1.8 2007/07/11 23:49:24 mr_bones_ Exp $

DESCRIPTION="A remote security scanner"
HOMEPAGE="http://www.nessus.org/"
DEPEND="~net-analyzer/nessus-libraries-${PV}
	~net-analyzer/libnasl-${PV}
	~net-analyzer/nessus-core-${PV}
	~net-analyzer/nessus-plugins-${PV}"
SLOT="0"
LICENSE="GPL-2"
KEYWORDS="~alpha ~amd64 ~ppc ~ppc64 ~sparc ~x86"
IUSE=""

pkg_postrm() {
	elog "Note: this is a META ebuild for ${P}."
	elog "to remove it completely or before re-emerging"
	elog "either use 'depclean', or remove/re-emerge these packages:"
	elog
	for dep in ${RDEPEND}; do
		elog "     ${dep}"
	done
	echo
}
