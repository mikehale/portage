# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-ruby/rake-remote_task/rake-remote_task-2.0.1.ebuild,v 1.2 2010/08/18 11:11:20 flameeyes Exp $

EAPI=2
USE_RUBY="ruby18"

RUBY_FAKEGEM_TASK_DOC="docs"
RUBY_FAKEGEM_DOCDIR="doc"
RUBY_FAKEGEM_EXTRADOC="History.txt README.txt"

inherit ruby-fakegem

DESCRIPTION="Vlad the Deployer's sexy brainchild is rake-remote_task, extending
Rake with remote task goodness."
HOMEPAGE="http://rubyhitsquad.com/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

ruby_add_bdepend "dev-ruby/hoe test? ( dev-ruby/minitest )"
ruby_add_rdepend ">=dev-ruby/open4-0.9.0"

ruby_all_install() {
	ruby_fakegem_install

	dodoc doco/* || die
}
