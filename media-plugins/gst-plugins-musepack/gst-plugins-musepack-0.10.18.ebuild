# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/media-plugins/gst-plugins-musepack/gst-plugins-musepack-0.10.18.ebuild,v 1.6 2010/08/05 20:16:34 ssuominen Exp $

inherit gst-plugins-bad

KEYWORDS="alpha amd64 ppc ppc64 x86 ~x86-interix ~amd64-linux ~x86-linux"
IUSE=""

RDEPEND=">=media-libs/gst-plugins-base-0.10.27
	>=media-sound/musepack-tools-444"
DEPEND="${RDEPEND}"
