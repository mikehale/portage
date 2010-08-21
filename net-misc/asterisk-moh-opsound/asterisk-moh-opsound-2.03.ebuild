# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/net-misc/asterisk-moh-opsound/asterisk-moh-opsound-2.03.ebuild,v 1.1 2010/08/20 23:12:53 chainsaw Exp $

EAPI="2"

DESCRIPTION="asterisk moh music"
HOMEPAGE="http://www.asterisk.org/"
CODECS="alaw g722 g729 +gsm siren7 siren14 sln16 ulaw wav"

SRC_URI=""
for c in ${CODECS}; do
	SRC_URI+=" ${c#+}? ( http://downloads.asterisk.org/pub/telephony/sounds/releases/${PN}-${c#+}-${PV}.tar.gz )"
done

IUSE="${CODECS}"
LICENSE="CCPL-Attribution-ShareAlike-3.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND=">=net-misc/asterisk-1.6.2.11-r1"

src_install() {
	local c

	for c in ${CODECS}; do
		if use ${c#+}; then
			for pf in CREDITS LICENSE CHANGES; do
				dodoc "$pf-$PN-${c#+}"
				rm "$pf-$PN-${c#+}"
			done
		fi
	done

	diropts -m 0770 -o asterisk -g asterisk
	insopts -m 0660 -o asterisk -g asterisk

	dodir /var/lib/asterisk/moh
	insinto /var/lib/asterisk/moh
	doins -r .

}

pkg_postinst() {
	local c has_once_codec=

	for c in ${CODECS}; do
			use ${c#+} && has_one_codec=1
	done

	[ -n "${has_one_codec}" ] || ewarn "You have none of the codec use flags (${CODECS}) set.  You need to have at least one set in order for this package to be useful."
}
