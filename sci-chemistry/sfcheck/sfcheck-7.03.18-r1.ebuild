# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/sci-chemistry/sfcheck/sfcheck-7.03.18-r1.ebuild,v 1.1 2010/06/15 14:55:05 jlec Exp $

EAPI="2"

inherit eutils toolchain-funcs

DESCRIPTION="Program for assessing the agreement between the atomic model and X-ray data or EM map"
HOMEPAGE="http://www.ysbl.york.ac.uk/~alexei/sfcheck.html"
#SRC_URI="http://www.ysbl.york.ac.uk/~alexei/downloads/sfcheck.tar.gz"
SRC_URI="mirror://gentoo/${P}.tar.gz"

SLOT="0"
KEYWORDS="~amd64 ~x86 ~amd64-linux ~x86-linux"
LICENSE="ccp4"
IUSE=""

RDEPEND="sci-libs/ccp4-libs"
DEPEND="${RDEPEND}
	!<sci-chmistry/ccp4-apps-6.1.3"

S="${WORKDIR}"/${PN}

src_prepare() {
	epatch "${FILESDIR}"/7.03.17-ldflags.patch

	emake \
		-C src \
		clean || die
}

src_compile() {
	MR_FORT="$(tc-getFC) ${FFLAGS}" \
	MR_LIBRARY="-lccp4f" \
	emake \
		-C src \
		all || die
}

src_install() {
	exeinto /usr/libexec/ccp4/bin/
	doexe bin/${PN} || die
	dosym ../libexec/ccp4/bin/${PN} /usr/bin/${PN}
	dodoc readme ${PN}.com.gz doc/${PN}* || die
}
