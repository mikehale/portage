# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-ruby/rack-test/rack-test-0.5.3.ebuild,v 1.4 2010/01/21 11:27:58 flameeyes Exp $

EAPI=2
USE_RUBY="ruby18"

# no documentation is generable, it needs hanna, which is broken
RUBY_FAKEGEM_TASK_DOC=""

RUBY_FAKEGEM_TASK_TEST="spec"

RUBY_FAKEGEM_EXTRADOC="History.txt README.rdoc"

inherit ruby-fakegem

DESCRIPTION="Rack::Test is a small, simple testing API for Rack apps."
HOMEPAGE="http://github.com/brynary/rack-test"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

ruby_add_rdepend '=dev-ruby/rack-1.0*'
ruby_add_bdepend test "dev-ruby/rspec dev-ruby/sinatra"
