# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/media-libs/libbs2b/libbs2b-3.0.0.ebuild,v 1.6 2009/06/04 20:05:17 klausman Exp $

inherit base

DESCRIPTION="Bauer stereophonic-to-binaural DSP library"
HOMEPAGE="http://bs2b.sourceforge.net/"
SRC_URI="mirror://sourceforge/bs2b/${P}.tar.bz2"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~alpha ~amd64 ~hppa ~ppc ~ppc64 ~x86 ~x86-fbsd"
IUSE=""

RDEPEND="media-libs/libsndfile"
DEPEND="${RDEPEND}
	dev-util/pkgconfig"

PATCHES=("${FILESDIR}/${P}-freebsd.patch")

src_install()
{
	emake install DESTDIR="${D}" || die "emake install failed"
}
