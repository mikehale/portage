# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/net-misc/xrdp/xrdp-0.4.1.ebuild,v 1.4 2010/04/05 14:06:49 flameeyes Exp $

EAPI="2"

inherit eutils multilib

DESCRIPTION="An open source remote desktop protocol(rdp) server."
HOMEPAGE="http://xrdp.sourceforge.net/"
SRC_URI="mirror://sourceforge/${PN}/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~sparc ~x86"
IUSE=""

DEPEND="sys-libs/pam"
RDEPEND="${DEPEND}
	 net-misc/tightvnc"

DESTDIR="/usr/$(get_libdir)/${PN}"

src_unpack() {
	unpack ${A}
	cd "${S}"

	epatch "${FILESDIR}/${P}-curdir.patch"
	epatch "${FILESDIR}"/${P}-asneeded.patch

	# fix cflags, broken paths, multilib, and insecure rpath in all makefiles
	find . -name Makefile -print0 | \
		xargs -0 sed \
		-i "s:CFLAGS = -Wall -O. :CFLAGS += :
			s:/usr/xrdp:${DESTDIR}:g
			s:/usr/lib/:/usr/$(get_libdir)/:g
			s:rpath,\.:rpath,${DESTDIR}:g"

	sed -i '/instfiles\/xrdp_control1.sh/ d' Makefile
}

src_compile() {
	emake -j1 DESTDIR="${DESTDIR}" || die "emake failed"
}

src_install() {
	emake -j1 DESTDIRDEB="${D}" installdeb || die "emake installdeb failed"
	emake -j1 -C sesman/tools DESTDIRDEB="${D}" installdeb || die "emake installdeb failed"
	emake -j1 -C sesman/libscp DESTDIRDEB="${D}" installdeb || die "emake installdeb failed"
	dodoc design.txt readme.txt sesman/startwm.sh
	doman "${D}/usr/man/"*/*
	keepdir /var/log/${PN}
	rm -rf "${D}${DESTDIR}/startwm.sh" "${D}/usr/man"
	exeinto "${DESTDIR}"
	doexe "${FILESDIR}/startwm.sh"
	doexe "sesman/sessvc"
	newinitd "${FILESDIR}/${PN}-initd" ${PN}
	newconfd "${FILESDIR}/${PN}-confd" ${PN}
	sed -i "s:LIBDIR:$(get_libdir):" "${D}/etc/init.d/${PN}"
}
