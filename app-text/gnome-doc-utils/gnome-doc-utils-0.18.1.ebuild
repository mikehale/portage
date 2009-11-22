# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/app-text/gnome-doc-utils/gnome-doc-utils-0.18.1.ebuild,v 1.1 2009/11/21 10:05:44 mrpouet Exp $

EAPI="2"

inherit gnome2 python

DESCRIPTION="A collection of documentation utilities for the Gnome project"
HOMEPAGE="http://www.gnome.org/"

LICENSE="GPL-2 LGPL-2.1"
SLOT="0"
KEYWORDS="~alpha ~amd64 ~arm ~hppa ~ia64 ~mips ~ppc ~ppc64 ~s390 ~sh ~sparc ~x86 ~x86-fbsd"
IUSE=""

RDEPEND=">=dev-libs/libxml2-2.6.12[python]
	 >=dev-libs/libxslt-1.1.8
	 >=dev-lang/python-2.4"
DEPEND="${RDEPEND}
	sys-devel/gettext
	>=dev-util/intltool-0.35
	>=dev-util/pkgconfig-0.9
	~app-text/docbook-xml-dtd-4.4"
# dev-libs/glib needed for eautofoo, bug #255114.

DOCS="AUTHORS ChangeLog NEWS README"

# FIXME: Highly broken with parallel make, see bug #286889
MAKEOPTS="${MAKEOPTS} -j1"

pkg_setup() {
	G2CONF="${G2CONF} --disable-scrollkeeper"
}

# If there is a need to reintroduce eautomake or eautoreconf, make sure
# to AT_M4DIR="tools m4", bug #224609 (m4 removes glib build time dep)

pkg_postinst() {
	python_need_rebuild
	python_mod_optimize $(python_get_sitedir)/xml2po
	gnome2_pkg_postinst
}

pkg_postrm() {
	python_mod_cleanup /usr/$(get_libdir)/python*/site-packages/xml2po
	gnome2_pkg_postrm
}
