# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/net-misc/vino/vino-2.26.2-r2.ebuild,v 1.9 2010/07/20 02:28:20 jer Exp $

EAPI="2"

inherit eutils gnome2

DESCRIPTION="An integrated VNC server for GNOME"
HOMEPAGE="http://www.gnome.org/"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="alpha amd64 arm ia64 ppc ppc64 sparc x86 ~x86-fbsd"
IUSE="avahi crypt gnutls ipv6 jpeg gnome-keyring libnotify networkmanager zlib"

RDEPEND=">=dev-libs/glib-2.17
	>=x11-libs/gtk+-2.13.1
	>=gnome-base/libgnomeui-2
	>=gnome-base/gconf-2
	>=gnome-base/libglade-2
	>=sys-apps/dbus-1.2.3
	>=net-libs/libsoup-2.24.0:2.4
	>=dev-libs/libunique-1.0.0
	dev-libs/dbus-glib
	x11-libs/libXext
	x11-libs/libXtst
	libnotify? ( >=x11-libs/libnotify-0.4.4 )
	gnome-keyring? ( >=gnome-base/gnome-keyring-2.20 )
	avahi? ( >=net-dns/avahi-0.6[dbus] )
	crypt? ( >=dev-libs/libgcrypt-1.1.90 )
	gnutls? ( >=net-libs/gnutls-1 )
	jpeg? ( media-libs/jpeg )
	networkmanager? ( >=net-misc/networkmanager-0.7 )
	zlib? ( sys-libs/zlib )"
DEPEND="${RDEPEND}
	>=dev-lang/perl-5
	>=dev-util/pkgconfig-0.9
	>=dev-util/intltool-0.35"

DOCS="AUTHORS ChangeLog MAINTAINERS NEWS README"

pkg_setup() {
	G2CONF="${G2CONF}
		$(use_enable avahi)
		$(use_enable crypt gcrypt)
		$(use_enable gnutls)
		$(use_enable ipv6)
		$(use_with jpeg)
		$(use_enable gnome-keyring)
		$(use_enable libnotify)
		$(use_enable networkmanager network-manager)
		$(use_with zlib)
		$(use_with zlib libz)
		--enable-libunique"
}

src_prepare() {
	gnome2_src_prepare

	# Fix autorestart loop, bug #277989
	epatch "${FILESDIR}/${P}-autorestart-loop.patch"

	# Fix intltoolize broken file, see upstream #577133
	sed "s:'\^\$\$lang\$\$':\^\$\$lang\$\$:g" -i po/Makefile.in.in || die "sed failed"
}

pkg_postinst() {
	gnome2_pkg_postinst

	elog "If you are getting refresh problems when using special 3D effects,"
	elog "try disabling XDamage extension. For that, you can run the following:"
	elog " gconftool-2 --type boolean --set /desktop/gnome/remote_access/disable_xdamage true"
	elog "This is due http://bugs.freedesktop.org/12255"
}
