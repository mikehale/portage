# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/x11-plugins/wmlongrun/wmlongrun-0.2.0.ebuild,v 1.7 2010/07/22 14:32:39 ssuominen Exp $

DESCRIPTION="A dockapp to monitor LongRun on a Transmeta Crusoe processor"
HOMEPAGE="http://seiichisato.jp/dockapps/"
SRC_URI="http://seiichisato.jp/dockapps/src/${P}.tar.gz"
LICENSE="GPL-2"
SLOT="0"
IUSE=""

RDEPEND="x11-libs/libX11
	x11-libs/libXext
	x11-libs/libXpm"
DEPEND="${RDEPEND}
	x11-proto/xextproto"

# Since this will only work with a Crusoe processor, it's safe to assume that
# the functionality is only available on x86.
KEYWORDS="x86 -*"

src_install() {
	emake DESTDIR="${D}" install || die
	dodoc README AUTHORS TODO MAKEDEV-cpuid-msr
}
