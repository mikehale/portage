# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/media-libs/opencv/opencv-2.0.0.ebuild,v 1.8 2010/07/27 19:27:49 ssuominen Exp $

EAPI=2

PYTHON_DEPEND="python? 2:2.6"

inherit cmake-utils python

MY_P=OpenCV-${PV}

DESCRIPTION="A collection of algorithms and sample code for various computer vision problems."
HOMEPAGE="http://opencv.willowgarage.com"
SRC_URI="mirror://sourceforge/${PN}library/${MY_P}.tar.bz2"

LICENSE="v4l? ( GPL-2 ) xine? ( GPL-2 ) BSD"
SLOT="0"
KEYWORDS="amd64 ~ppc x86"
IUSE="debug +deprecated examples ffmpeg gstreamer gtk ieee1394 jpeg jpeg2k
mmx octave openmp png python sse sse2 sse3 test tiff v4l xine"

RDEPEND="sys-libs/zlib
	ieee1394? ( sys-libs/libraw1394
		media-libs/libdc1394:2 )
	ffmpeg? ( >=media-video/ffmpeg-0.5 )
	gstreamer? ( media-libs/gstreamer )
	gtk? ( x11-libs/gtk+:2 )
	jpeg2k? ( media-libs/jasper )
	jpeg? ( media-libs/jpeg )
	png? ( media-libs/libpng )
	tiff? ( media-libs/tiff )
	xine? ( media-libs/xine-lib )
	octave? ( sci-mathematics/octave )"
DEPEND="${RDEPEND}
	octave? ( dev-lang/swig )
	python? ( deprecated? ( dev-lang/swig ) )
	dev-util/pkgconfig"

S=${WORKDIR}/${MY_P}

PATCHES=( "${FILESDIR}/${P}-multilib.patch"
	"${FILESDIR}/${P}-libpng14.patch" )

# Skip test suite for -r0, try to solve it in -r1.
RESTRICT="test"

src_configure() {
	mycmakeargs="${mycmakeargs}
		-DCMAKE_SKIP_RPATH=ON
		$(cmake-utils_use_build examples)
		$(cmake-utils_use_build python NEW_PYTHON_SUPPORT)
		$(cmake-utils_use_build octave OCTAVE_SUPPORT)
		$(cmake-utils_use_build test TESTS)
		$(cmake-utils_use_enable openmp)
		-DUSE_IPP=OFF
		$(cmake-utils_use mmx USE_MMX)
		-DUSE_O3=OFF
		-DUSE_OMIT_FRAME_POINTER=OFF
		$(cmake-utils_use sse USE_SSE)
		$(cmake-utils_use sse2 USE_SSE2)
		$(cmake-utils_use sse3 USE_SSE3)
		$(cmake-utils_use_with ieee1394 1394)
		$(cmake-utils_use_with ffmpeg)
		$(cmake-utils_use_with gstreamer)
		$(cmake-utils_use_with gtk)
		$(cmake-utils_use_with jpeg2k jasper)
		$(cmake-utils_use_with jpeg)
		$(cmake-utils_use_with png)
		$(cmake-utils_use_with tiff)
		-DWITH_UNICAP=OFF
		$(cmake-utils_use_with v4l)
		$(cmake-utils_use_with xine)"

	if use python; then
		mycmakeargs="${mycmakeargs}
			$(cmake-utils_use_build deprecated SWIG_PYTHON_SUPPORT)"
	fi

	cmake-utils_src_configure
}
