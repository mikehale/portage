# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/media-plugins/gst-plugins-xvid/gst-plugins-xvid-0.10.19.ebuild,v 1.1 2010/08/03 02:54:43 leio Exp $

inherit gst-plugins-bad

KEYWORDS="~amd64 ~x86"
IUSE=""
DESCRIPTION="GStreamer plugin for XviD (MPEG-4) video encoding/decoding support"

RDEPEND="media-libs/xvid
	>=media-libs/gst-plugins-base-0.10.29"
DEPEND="${RDEPEND}"
