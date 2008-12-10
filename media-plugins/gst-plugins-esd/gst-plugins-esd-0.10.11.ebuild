# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/media-plugins/gst-plugins-esd/gst-plugins-esd-0.10.11.ebuild,v 1.1 2008/12/05 21:34:39 ssuominen Exp $

inherit gst-plugins-good

KEYWORDS="~alpha ~amd64 ~arm ~hppa ~ia64 ~ppc ~ppc64 ~sh ~sparc ~x86 ~x86-fbsd"
IUSE=""

DEPEND=">=media-sound/esound-0.2.8
	>=media-libs/gstreamer-0.10.21
	>=media-libs/gst-plugins-base-0.10.21"