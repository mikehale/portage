# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-util/mono-tools/mono-tools-9999.ebuild,v 1.4 2009/09/02 14:05:04 loki_val Exp $

EAPI=2

inherit go-mono mono autotools

DESCRIPTION="Set of useful Mono related utilities"
HOMEPAGE="http://www.mono-project.com/"

LICENSE="GPL-2 MIT"
SLOT="0"
KEYWORDS=""
IUSE="webkit gtkhtml +xulrunner"

RDEPEND="=virtual/monodoc-${GO_MONO_REL_PV}*
	>=dev-dotnet/gtk-sharp-2.12.6
	>=dev-dotnet/glade-sharp-2.12.6
	>=dev-dotnet/gconf-sharp-2
	gtkhtml? ( >=dev-dotnet/gtkhtml-sharp-2.24.0 )
	webkit? ( >=dev-dotnet/webkit-sharp-0.2-r1 )
	xulrunner? ( =dev-dotnet/gluezilla-${PV} )
	"
DEPEND="${RDEPEND}
	sys-devel/gettext
	>=dev-util/pkgconfig-0.19"

PATCHES=( "${FILESDIR}/${PN}-2.4-html-renderer-fixes.patch" )

#Fails parallel make.
MAKEOPTS="${MAKEOPTS} -j1"

pkg_setup() {
	if ! use webkit && ! use gtkhtml && ! use xulrunner
	then
		die "You must USE either webkit, gtkhtml or xulrunner"
	fi
}

src_prepare() {
	glib-gettextize --force --copy || die "glib-gettextize --force --copy failed"
	go-mono_src_prepare
}

src_configure() {
	econf	--disable-dependency-tracking \
		--disable-gecko \
		$(use_enable gtkhtml) \
		$(use_enable webkit) \
		$(use_enable xulrunner monowebbrowser) \
		|| die "configure failed"
}

src_install() {
	go-mono_src_install
	# Defunct .desktop file, see bug 266694
	find "${D}" -type f -name 'mprof-heap-viewer.desktop' -exec rm -f '{}' '+' || die "removal of mprof-heap-viewer.desktop failed"
}
