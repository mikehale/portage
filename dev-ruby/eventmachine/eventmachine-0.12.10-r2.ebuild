# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-ruby/eventmachine/eventmachine-0.12.10-r2.ebuild,v 1.4 2010/08/08 13:43:49 graaff Exp $

EAPI="2"
# jruby → has shims for Java handling but tests fail badly, remaining
# stuck; avoid that for now.
USE_RUBY="ruby18 ree18 ruby19"

RUBY_FAKEGEM_DOCDIR="rdoc"
RUBY_FAKEGEM_EXTRADOC="docs/ChangeLog README"

inherit ruby-fakegem

DESCRIPTION="EventMachine is a fast, simple event-processing library for Ruby programs."
HOMEPAGE="http://rubyeventmachine.com"

LICENSE="|| ( GPL-2 Ruby )"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~ppc64 ~x86"
IUSE=""

DEPEND="${DEPEND}
	dev-libs/openssl"
RDEPEND="${RDEPEND}
	dev-libs/openssl"

all_ruby_prepare() {
	# fix building with RDoc 2.5.x (bug #317281) — upstream b12663e475514b02a28b60d4427a48be7d75faac
	# fix tests with Ruby 1.9 — sent upstream
	# fix tests on non-FreeBSD (where kqueue is missing) — sent upstream
	# fix building when git is not available — sent upstream
	epatch "${FILESDIR}/${P}-gentoo.patch"

	# Fix https test: bug 299782
	epatch "${FILESDIR}/${P}-https-test.patch"
}

each_ruby_configure() {
	for extdir in ext ext/fastfilereader; do
		pushd $extdir
		${RUBY} extconf.rb || die "extconf.rb failed for ${extdir}"
		popd
	done
}

each_ruby_compile() {
	for extdir in ext ext/fastfilereader; do
		pushd $extdir
		# both extensions use C++, so use the CXXFLAGS not the CFLAGS
		emake CFLAGS="${CXXFLAGS} -fPIC" archflag="${LDFLAGS}" || die "emake failed for ${extdir}"
		popd
		cp $extdir/*.so lib/ || die "Unable to copy extensions for ${extdir}"
	done
}

all_ruby_install() {
	all_fakegem_install

	insinto /usr/share/doc/${PF}/
	doins -r examples || die "Failed to install examples"
}
