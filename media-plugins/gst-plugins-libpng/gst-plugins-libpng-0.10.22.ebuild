# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/media-plugins/gst-plugins-libpng/gst-plugins-libpng-0.10.22.ebuild,v 1.4 2010/08/05 20:26:51 ssuominen Exp $

inherit gst-plugins-good

DESCRIPTION="GStreamer encoder/decoder for PNG images"
KEYWORDS="~alpha amd64 ~arm ~ppc ppc64 ~sparc x86"
IUSE=""

RDEPEND=">=media-libs/libpng-1.4
	>=media-libs/gst-plugins-base-0.10.29"
DEPEND="${RDEPEND}"
