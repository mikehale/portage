# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/x11-misc/3dfm/3dfm-1.0.ebuild,v 1.7 2010/07/21 14:29:03 ssuominen Exp $

DESCRIPTION="OpenGL-based 3D File Manager"
HOMEPAGE="http://sourceforge.net/projects/innolab/"
SRC_URI="mirror://sourceforge/innolab/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ppc x86"
IUSE=""

DEPEND="virtual/opengl
	virtual/glut"

src_install() {
	emake DESTDIR="${D}" install || die
	mv "${D}"/usr/bin/interface "${D}"/usr/bin/3dfm

	dodoc AUTHORS ChangeLog README
}
