# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-db/vbisam/vbisam-2.0.ebuild,v 1.2 2010/03/10 10:03:49 josejx Exp $

KEYWORDS="~ppc ~x86"

DESCRIPTION="replacement for IBM's C-ISAM"
HOMEPAGE="http://sourceforge.net/projects/vbisam"
SRC_URI="mirror://sourceforge/tiny-cobol/isam/${P}.tar.bz2"
LICENSE="GPL-2 LGPL-2"
SLOT="0"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_install()
{
	emake install DESTDIR="${D}" || die "emake install failed."
	dodoc ChangeLog README NEWS AUTHORS
}
