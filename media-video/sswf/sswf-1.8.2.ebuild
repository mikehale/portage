# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/media-video/sswf/sswf-1.8.2.ebuild,v 1.1 2008/04/21 17:20:42 drac Exp $

DESCRIPTION="A C++ Library and a script language tool to create Flash (SWF) movies up to version 8."
HOMEPAGE="http://sswf.sourceforge.net"
SRC_URI="mirror://sourceforge/${PN}/${P}-src.tar.bz2
	mirror://sourceforge/${PN}/${P}-doc.tar.bz2"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~x86"
IUSE="debug doc examples"

RDEPEND="media-libs/jpeg
	media-libs/freetype"
DEPEND="${RDEPEND}
	dev-util/pkgconfig"

src_compile() {
	econf --disable-dependency-tracking --disable-docs \
		$(use_enable debug) $(use_enable debug yydebug)
	emake || die "emake failed."
}

src_install () {
	emake DESTDIR="${D}" install || die "emake install failed."

	dodoc README.txt doc/{ASC-TODO,AUTHORS,CHANGES,LINKS,NOTES,TODO}.txt
	rm -f "${D}"/usr/share/${PN}/*.txt

	use examples || rm -rf "${D}"/usr/share/${PN}/samples

	doman doc/man/man1/*.1

	if use doc; then
		doman doc/man/man3/*.3
		dohtml -r doc/html/*
	fi
}
