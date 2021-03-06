# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-libs/totem-pl-parser/totem-pl-parser-2.26.3-r1.ebuild,v 1.11 2010/07/20 01:51:50 jer Exp $

EAPI="2"

GCONF_DEBUG="no"

inherit autotools eutils gnome2

DESCRIPTION="Playlist parsing library"
HOMEPAGE="http://www.gnome.org/projects/totem/"

LICENSE="LGPL-2"
SLOT="0"
KEYWORDS="alpha amd64 arm ia64 ppc ppc64 sparc x86 ~x86-fbsd"
IUSE="doc test"

RDEPEND=">=dev-libs/glib-2.17.3
	>=x11-libs/gtk+-2.12
	dev-libs/gmime:2.4"
DEPEND="${RDEPEND}
	!<media-video/totem-2.21
	>=dev-util/intltool-0.35
	dev-util/gtk-doc-am
	doc? ( >=dev-util/gtk-doc-1.11 )"

DOCS="AUTHORS ChangeLog NEWS"
G2CONF="${G2CONF} --disable-static"

src_prepare() {
	gnome2_src_prepare

	# FIXME: tarball generated with broken gtk-doc, revisit me.
	if use doc; then
		sed "/^TARGET_DIR/i \GTKDOC_REBASE=/usr/bin/gtkdoc-rebase" \
			-i gtk-doc.make || die "sed 1 failed"
	else
		sed "/^TARGET_DIR/i \GTKDOC_REBASE=$(type -P true)" \
			-i gtk-doc.make || die "sed 2 failed"
	fi

	# GNOME Bug 522639 and GNOME Bug 589559
	# Use gmime instead of libcamel removing the e-d-s dependency
	# Not needed with 2.28
	epatch "${FILESDIR}/${P}-no-libcamel-use-gmime.patch"

	# http://bugzilla.gnome.org/show_bug.cgi?id=577774
	epatch "${FILESDIR}/${PN}-2.26.1-fix-tests-without-gtk-doc.patch"
	intltoolize --automake --copy --force || die "intltoolize failed"
	eautoreconf
}
