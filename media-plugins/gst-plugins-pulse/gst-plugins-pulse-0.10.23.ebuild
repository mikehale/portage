# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/media-plugins/gst-plugins-pulse/gst-plugins-pulse-0.10.23.ebuild,v 1.1 2010/07/31 11:09:00 leio Exp $

inherit gst-plugins-good

DESCRIPTION="GStreamer plugin for the PulseAudio sound server"
KEYWORDS="~alpha ~amd64 ~arm ~hppa ~ia64 ~ppc ~ppc64 ~sh ~sparc ~x86"
IUSE=""

# >=0.9.15 ensures working per-stream volume
RDEPEND=">=media-sound/pulseaudio-0.9.15
	>=media-libs/gst-plugins-base-0.10.29"
DEPEND="${RDEPEND}"
