# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/net-proxy/ntlmaps/ntlmaps-0.9.9.6.ebuild,v 1.4 2007/11/04 08:15:06 mrness Exp $

inherit eutils

DESCRIPTION="NTLM proxy Authentication against MS proxy/web server"
HOMEPAGE="http://ntlmaps.sourceforge.net/"
SRC_URI="mirror://sourceforge/${PN}/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~alpha ~amd64 ~arm ~hppa ~ia64 ~ppc ~ppc64 ~s390 ~x86"
IUSE=""

DEPEND="dev-lang/python"

pkg_setup() {
	enewgroup ntlmaps
	enewuser ntlmaps -1 -1 -1 ntlmaps
}

src_unpack() {
	unpack ${A}

	epatch "${FILESDIR}/${P}-gentoo.patch"

	#stupid windoze style
	cd "${S}"
	sed -i -e 's/\r//' lib/*.py server.cfg doc/*.{txt,htm}
}

src_install() {
	# exes ------------------------------------------------------------------
	exeinto /usr/bin
	newexe main.py ntlmaps || die "failed to install main program"
	insinto /usr/lib/ntlmaps
	doins lib/* || die "failed to install python modules"
	# doc -------------------------------------------------------------------
	dodoc doc/*.txt
	dohtml doc/*.{gif,htm}
	# conf ------------------------------------------------------------------
	insopts -m0640 -g ntlmaps
	insinto /etc/ntlmaps
	doins server.cfg
	newinitd "${FILESDIR}/ntlmaps.init" ntlmaps
	# log -------------------------------------------------------------------
	diropts -m 0770 -g ntlmaps
	keepdir /var/log/ntlmaps
}

pkg_preinst() {
	#Remove the following lines sometime in December 2005
	#Their purpose is to fix security bug #107766
	if [ -f "${ROOT}/etc/ntlmaps/server.cfg" ]; then
		chmod 0640 "${ROOT}/etc/ntlmaps/server.cfg"
		chgrp ntlmaps "${ROOT}/etc/ntlmaps/server.cfg"
	fi
}

pkg_prerm() {
	einfo "Removing python compiled bytecode"
	rm -f "${ROOT}"/usr/lib/ntlmaps/*.py?
}
