# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-ruby/ruby-gtkglext/ruby-gtkglext-0.19.1.ebuild,v 1.4 2010/01/25 19:20:54 armin76 Exp $

inherit ruby ruby-gnome2

DESCRIPTION="Ruby GtkGLExt bindings"
KEYWORDS="alpha amd64 ia64 ppc sparc x86"
IUSE=""
USE_RUBY="ruby18"
DEPEND=">=x11-libs/gtkglext-1.0.3
	>=x11-libs/gtk+-2"
RDEPEND="dev-ruby/ruby-opengl
	dev-ruby/ruby-glib2
	dev-ruby/ruby-gtk2"
DEPEND="${DEPEND}
	dev-util/pkgconfig"
