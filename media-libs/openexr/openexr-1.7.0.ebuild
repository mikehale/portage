# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/media-libs/openexr/openexr-1.7.0.ebuild,v 1.1 2010/07/24 16:23:27 ssuominen Exp $

EAPI=2
inherit eutils libtool

DESCRIPTION="ILM's OpenEXR high dynamic-range image file format libraries"
HOMEPAGE="http://openexr.com/"
SRC_URI="http://download.savannah.gnu.org/releases/openexr/${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~alpha ~amd64 -arm ~hppa ~ia64 ~ppc ~ppc64 ~s390 ~sh ~sparc ~x86 ~x86-fbsd"
IUSE="examples static-libs"

RDEPEND="sys-libs/zlib
	>=media-libs/ilmbase-1.0.2"
DEPEND="${RDEPEND}
	dev-util/pkgconfig"

src_prepare() {
	sed -i \
		-e "s:/var/tmp/:${T}:" \
		IlmImfTest/tmpDir.h || die # Fix path for testsuite

	epatch "${FILESDIR}"/${P}-gcc43.patch

	elibtoolize
}

src_configure() {
	econf \
		--disable-dependency-tracking \
		$(use_enable static-libs static) \
		$(use_enable examples imfexamples)
}

src_install() {
	emake \
		DESTDIR="${D}" \
		docdir="/usr/share/doc/${PF}/pdf" \
		examplesdir="/usr/share/doc/${PF}/examples" \
		install || die

	dodoc AUTHORS ChangeLog NEWS README

	if use examples; then
		dobin IlmImfExamples/imfexamples || die
	else
		rm -rf "${D}"/usr/share/doc/${PF}/examples
	fi

	find "${D}" -name '*.la' -delete
}
