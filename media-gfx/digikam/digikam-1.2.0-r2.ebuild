# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/media-gfx/digikam/digikam-1.2.0-r2.ebuild,v 1.1 2010/07/09 23:32:27 reavertm Exp $

EAPI="2"

KDE_LINGUAS="ar be bg ca cs da de el es et eu fa fi fr ga gl he hi is it ja km
ko lt lv lb nds ne nl nn pa pl pt pt_BR ro ru se sk sl sv th tr uk vi zh_CN zh_TW"
KMNAME="extragear/graphics"
inherit kde4-base

MY_P="${PN}-${PV/_/-}"

DESCRIPTION="A digital photo management application for KDE."
HOMEPAGE="http://www.digikam.org/"
SRC_URI="mirror://sourceforge/${PN}/${MY_P}.tar.bz2"

LICENSE="GPL-2"
KEYWORDS="~amd64 ~x86"
SLOT="4"
IUSE="addressbook debug doc geolocation gphoto2 lensfun semantic-desktop +thumbnails video"

CDEPEND="
	>=kde-base/kdelibs-${KDE_MINIMAL}[semantic-desktop?]
	>=kde-base/libkdcraw-${KDE_MINIMAL}
	>=kde-base/libkexiv2-${KDE_MINIMAL}
	>=kde-base/libkipi-${KDE_MINIMAL}
	>=kde-base/solid-${KDE_MINIMAL}
	media-libs/jasper
	>=media-libs/jpeg-8
	media-libs/lcms:0
	media-libs/liblqr
	media-libs/libpng
	media-libs/tiff
	media-libs/libpgf
	>=media-plugins/kipi-plugins-1.2.0-r1
	virtual/lapack
	x11-libs/qt-gui[qt3support]
	x11-libs/qt-sql[sqlite]
	addressbook? ( >=kde-base/kdepimlibs-${KDE_MINIMAL} )
	geolocation? ( >=kde-base/marble-${KDE_MINIMAL} )
	gphoto2? ( media-libs/libgphoto2 )
	lensfun? ( media-libs/lensfun )
"
RDEPEND="${CDEPEND}
	>=kde-base/kreadconfig-${KDE_MINIMAL}
	video? (
		|| (
			>=kde-base/mplayerthumbs-${KDE_MINIMAL}
			>=kde-base/ffmpegthumbs-${KDE_MINIMAL}
		)
	)
"
# gcc[fortran] is required since we cannot otherwise link to the lapack library
#   (the fun of unbundling)
DEPEND="${CDEPEND}
	sys-devel/gcc[fortran]
	sys-devel/gettext
"

S="${WORKDIR}/${MY_P}"

src_prepare() {
	# Patch to prevent a crash on startup in RatingWidget (kde#232628)
	epatch "${FILESDIR}/${P}-ratingwidget.patch"
	# Patch to unbundled libpgf.
	epatch "${FILESDIR}/${P}-libpgf.patch"
	# Patch to unbundle lapack.
	epatch "${FILESDIR}/${P}-lapack.patch"

	kde4-base_src_prepare
}

src_configure() {
	local backend

	use semantic-desktop && backend="Nepomuk" || backend="None"
	# LQR = only allows to choose between bundled/external
	mycmakeargs=(
		-DWITH_LQR=ON
		-DGWENVIEW_SEMANTICINFO_BACKEND=${backend}
		$(cmake-utils_use_with addressbook KdepimLibs)
		$(cmake-utils_use_build doc)
		$(cmake-utils_use_with geolocation MarbleWidget)
		$(cmake-utils_use_enable gphoto2 GPHOTO2)
		$(cmake-utils_use_with gphoto2)
		$(cmake-utils_use_with lensfun LensFun)
		$(cmake-utils_use_with semantic-desktop Soprano)
		-DENABLE_THEMEDESIGNER=OFF
		$(cmake-utils_use_enable thumbnails THUMBS_DB)
	)

	kde4-base_src_configure
}
