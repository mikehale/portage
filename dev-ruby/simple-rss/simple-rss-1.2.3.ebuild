# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-ruby/simple-rss/simple-rss-1.2.3.ebuild,v 1.1 2010/07/08 19:22:33 graaff Exp $

EAPI=2
USE_RUBY="ruby18"

RUBY_FAKEGEM_TASK_DOC="doc"
RUBY_FAKEGEM_DOCDIR="html"
RUBY_FAKEGEM_EXTRADOC="README"

inherit ruby-fakegem

DESCRIPTION="Simple RSS is a simple, flexible, extensible, and liberal RSS and
Atom reader for Ruby."
HOMEPAGE="http://simple-rss.rubyforge.org/"
LICENSE="LGPL-2"

KEYWORDS="~x86 ~amd64"
SLOT="0"
IUSE=""

RUBY_PATCHES=( "${P}-no-media-rss.patch" )

ruby_add_bdepend "test? ( virtual/ruby-test-unit )"
