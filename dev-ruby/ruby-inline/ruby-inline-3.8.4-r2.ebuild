# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-ruby/ruby-inline/ruby-inline-3.8.4-r2.ebuild,v 1.1 2010/08/28 13:15:41 graaff Exp $

EAPI=2

USE_RUBY="ruby18 ree18 ruby19"

RUBY_FAKEGEM_NAME="RubyInline"

RUBY_FAKEGEM_TASK_DOC="docs"
RUBY_FAKEGEM_DOCDIR="doc"
RUBY_FAKEGEM_EXTRADOC="README.txt History.txt"

inherit ruby-fakegem

DESCRIPTION="Allows to embed C/C++ in Ruby code"
HOMEPAGE="http://www.zenspider.com/ZSS/Products/RubyInline/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~ia64 ~ppc ~ppc64 ~sparc ~x86 ~amd64-linux ~x86-linux ~ppc-macos ~x86-macos ~x86-solaris"
IUSE=""

ruby_add_rdepend dev-ruby/zentest

ruby_add_bdepend "
	doc? (
		dev-ruby/hoe
		dev-ruby/hoe-seattlerb
	)
	test? (
		dev-ruby/hoe
		dev-ruby/hoe-seattlerb
		virtual/ruby-test-unit
	)"

all_ruby_prepare() {
	# we have to patch the code so that it takes the RUBY_DESCRIPTION
	# into consideration, to avoid loading Ruby-Enterprise (REE18)
	# objects in MRI and vice-versa; we're a bit “greedier” since we
	# will rebuild objects even when just switching versions, but
	# it'll be better this way than being too conservatives.
	epatch "${FILESDIR}/${P}-gentoo.patch"

	# Respect ruby's (and thus Gentoo's) LDFLAGS, and explicitly link
	# against the ruby shared library to avoid confusion and potential
	# crashes when later using the shared object.
	epatch "${FILESDIR}/${P}-ldflags.patch"
}

all_ruby_install() {
	all_fakegem_install

	docinto examples
	dodoc example.rb example2.rb demo/*.rb || die
}
