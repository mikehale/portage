# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-ruby/ruby-termios/ruby-termios-0.9.6-r1.ebuild,v 1.4 2010/08/23 16:11:53 hwoarang Exp $

EAPI=2
USE_RUBY="ruby18"

inherit ruby-ng

DESCRIPTION="A Ruby interface to termios"
HOMEPAGE="http://arika.org/ruby/termios"	# trailing / isn't needed
SRC_URI="http://github.com/arika/ruby-termios/tarball/version_0_9_6 -> ${P}.tar.gz"
LICENSE="Ruby"
SLOT="0"
KEYWORDS="~alpha amd64 ~hppa ~ia64 ~mips ~ppc ~sparc x86"
IUSE=""

S="${WORKDIR}/arika-${PN}-94fd9ac"

each_ruby_configure() {
	${RUBY} extconf.rb || die
}

each_ruby_compile() {
	emake || die
}

each_ruby_test() {
	${RUBY} test/test0.rb || die "tests failed"
}

each_ruby_install() {
	emake DESTDIR="${D}" install || die
}

all_ruby_install() {
	dodoc ChangeLog README termios.rd

	insinto /usr/share/doc/${PF}/examples
	doins examples/* || die
}
