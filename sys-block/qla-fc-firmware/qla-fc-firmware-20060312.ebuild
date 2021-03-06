# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/sys-block/qla-fc-firmware/qla-fc-firmware-20060312.ebuild,v 1.2 2006/03/31 05:27:19 rajiv Exp $

DESCRIPTION="QLogic Linux Fibre Channel HBA Firmware for ql2xxx cards"
HOMEPAGE="ftp://ftp.qlogic.com/outgoing/linux/firmware/"
SRC_URI="mirror://gentoo/${P}.tar.bz2"
LICENSE="qlogic-fibre-channel-firmware"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""
DEPEND=""
RDEPEND=""

FW_BASENAME="ql2100_fw.bin ql2200_fw.bin ql2300_fw.bin ql2322_fw.bin
ql2400_fw.bin ql6312_fw.bin"

src_install() {
	dodoc LICENSE # We must install this, say QLogic's people.
	dodoc README.gentoo CURRENT_VERSIONS
	insinto /lib/firmware
	# some older firmware are always provided by upstream
	# for reasons documented in CURRENT_VERSIONS
	for f in ${FW_BASENAME} ; do
		doins ${f}.*
		latest_f="$(ls ${f}.* | sort -ng | tail -n1)"
		dosym ${latest_f} /lib/firmware/${f}
	done
}
