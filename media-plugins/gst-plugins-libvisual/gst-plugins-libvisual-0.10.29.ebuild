# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/media-plugins/gst-plugins-libvisual/gst-plugins-libvisual-0.10.29.ebuild,v 1.5 2010/08/29 14:40:02 armin76 Exp $

inherit gst-plugins-base

KEYWORDS="amd64 ~ppc ppc64 x86"
IUSE=""

RDEPEND=">=media-libs/libvisual-0.4
	>=media-plugins/libvisual-plugins-0.4"
DEPEND="${RDEPEND}"
