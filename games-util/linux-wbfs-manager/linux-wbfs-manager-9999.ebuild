# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/games-util/linux-wbfs-manager/linux-wbfs-manager-9999.ebuild,v 1.2 2010/01/05 15:53:19 vapier Exp $

EAPI=2
if [[ "${PV}" == "9999" ]]; then
	ESVN_REPO_URI="http://linux-wbfs-manager.googlecode.com/svn/trunk/"
	inherit toolchain-funcs subversion
	SRC_URI=""
	#KEYWORDS=""
else
	inherit toolchain-funcs
	SRC_URI="http://linux-wbfs-manager.googlecode.com/files/${P}.tar.gz"
	KEYWORDS="~amd64 ~x86"
fi;

DESCRIPTION="WBFS manager for Linux using GTK+"
HOMEPAGE="http://code.google.com/p/linux-wbfs-manager/"

LICENSE="GPL-2"
SLOT="0"
IUSE=""

DEPEND="dev-libs/glib:2
	gnome-base/libglade:2.0"

if [[ ${PV} == "9999" ]] ; then
	S=${WORKDIR}/${ECVS_MODULE}
else
	S=${WORKDIR}/${PN}
fi

src_unpack() {
	if [[ ${PV} == "9999" ]]; then
		subversion_src_unpack
	else
		unpack ${A}
	fi
}

src_compile() {
	emake CC="$(tc-getCC)" || die
}

src_install() {
	dobin wbfs_gtk || die
	dodoc README
}
