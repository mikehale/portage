# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/net-proxy/ziproxy/ziproxy-3.1.3.ebuild,v 1.1 2010/07/21 00:23:33 sbriesen Exp $

EAPI="2"

inherit autotools eutils

DESCRIPTION="A forwarding, non-caching, compressing web proxy server"
HOMEPAGE="http://ziproxy.sourceforge.net/"
SRC_URI="mirror://sourceforge/${PN}/${P}.tar.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~sparc ~x86"
IUSE="jpeg2k xinetd"

DEPEND="media-libs/giflib
	media-libs/libpng
	media-libs/jpeg
	sys-libs/zlib
	jpeg2k? ( media-libs/jasper )"

RDEPEND="${DEPEND}
	xinetd? ( virtual/inetd )"

pkg_setup() {
	enewgroup ziproxy
	enewuser ziproxy -1 -1 -1 ziproxy
}

src_prepare() {
	# fix sample config file
	sed -i \
		-e "s:/var/ziproxy/:/var/lib/ziproxy/:g" \
		-e "s:%j-%Y.log:/var/log/ziproxy/%j-%Y.log:g" \
		etc/ziproxy/ziproxy.conf || die

	# fix sample xinetd config
	sed -i \
		-e "s:/usr/bin/:/usr/sbin/:g" \
		-e "s:\(.*port.*\):\1\n\ttype\t\t\t= UNLISTED:g" \
		-e "s:root:ziproxy:g" \
		etc/xinetd.d/ziproxy || die

	AT_M4DIR="config" eautoreconf
}

src_configure() {
	local myconf
	use jpeg2k && myconf="--with-jasper"  # use_with doesn't work

	econf \
		--with-cfgfile=/etc/ziproxy/ziproxy.conf \
		${myconf}
}

src_install() {
	emake DESTDIR="${D}" install || die

	dodir /usr/sbin
	mv -vf "${D}"usr/{,s}bin/ziproxy || die

	dobin src/tools/ziproxy_genhtml_stats.sh || die

	newinitd "${FILESDIR}"/${PN}.initd ${PN}
	newconfd "${FILESDIR}"/${PN}.confd ${PN}

	dodoc ChangeLog CREDITS README README.tools
	use jpeg2k && dodoc JPEG2000.txt

	insinto /etc
	doins -r etc/ziproxy || die

	insinto /var/lib/ziproxy/error
	doins var/ziproxy/error/*.html || die

	if use xinetd; then
		insinto /etc/xinetd.d
		doins etc/xinetd.d/ziproxy || die
	fi

	diropts -m0750 -o ziproxy -g ziproxy
	keepdir /var/log/ziproxy
}
