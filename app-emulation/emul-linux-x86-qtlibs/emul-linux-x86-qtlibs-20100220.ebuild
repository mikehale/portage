# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/app-emulation/emul-linux-x86-qtlibs/emul-linux-x86-qtlibs-20100220.ebuild,v 1.2 2010/03/22 14:01:21 pacho Exp $

inherit eutils emul-linux-x86

LICENSE="LGPL-2.1 GPL-3"
KEYWORDS="-* amd64"
IUSE=""

DEPEND=""
RDEPEND="~app-emulation/emul-linux-x86-baselibs-${PV}
	~app-emulation/emul-linux-x86-xlibs-${PV}"

src_install() {
	emul-linux-x86_src_install

	# Set LDPATH for not needing x11-libs/qt-core
	cat <<-EOF > "${T}/44qt4-emul"
	LDPATH=/usr/lib32/qt4
	EOF
	doenvd "${T}/44qt4-emul"
}
