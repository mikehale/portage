# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-ruby/parsetree/parsetree-3.0.5-r1.ebuild,v 1.3 2010/08/23 13:48:30 flameeyes Exp $

EAPI=2

USE_RUBY="ruby18"

RUBY_FAKEGEM_NAME="ParseTree"

RUBY_FAKEGEM_TASK_DOC="docs"
RUBY_FAKEGEM_DOCDIR="doc"
RUBY_FAKEGEM_EXTRADOC="README.txt History.txt"

inherit ruby-fakegem

DESCRIPTION="ParseTree extracts the parse tree for a Class or method and returns it as a s-expression."
HOMEPAGE="http://www.zenspider.com/ZSS/Products/ParseTree/"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~ia64 ~ppc ~ppc64 ~sparc ~x86 ~amd64-linux ~x86-linux ~ppc-macos ~x86-macos ~x86-solaris"
IUSE=""

ruby_add_rdepend '
	>=dev-ruby/ruby-inline-3.8.4-r1
	>=dev-ruby/sexp-processor-3.0.0'
ruby_add_bdepend "
	test? (
		dev-ruby/hoe
		dev-ruby/hoe-seattlerb
		dev-ruby/minitest
		dev-ruby/ruby2ruby
	)
	doc? (
		dev-ruby/hoe
		dev-ruby/hoe-seattlerb
	)"

src_compile() {
	chmod 0755 ${WORKDIR/work/homedir} || die "Failed to fix permissions on home"
	ruby-ng_src_compile
}

each_ruby_compile() {
	# The ruby extension uses RubyInline to use C code within Ruby;
	# since it causes us no little pain, we'll do our best here to
	# prebuild the extensions.
	local orig_HOME="${HOME}"
	export HOME="${T}/$(basename ${RUBY})"
	mkdir -p "$HOME"

	${RUBY} -Ilib -rparse_tree -e '' || die "Unable to load ${PN}"

	mkdir lib/inline
	cp "$HOME"/.ruby_inline/*.so lib/inline/ || die

	export HOME="$orig_home"
}

src_test() {
	chmod 0755 ${WORKDIR/work/homedir} || die "Failed to fix permissions on home"
	ruby-ng_src_test
}

pkg_postinst() {
	elog "${CATEGORY}/${PN} uses the RubyInline library to build its parser."
	elog "RubyInline builds loadable extensions at runtime in your home"
	elog "directory if they are not supplied by the gems."
	elog ""
	elog "We are currently providing you with pre-built extensions for"
	elog "the Ruby implementations you're using. Unfortunately these are"
	elog "different from version to version, so you might have to"
	elog "rebuild ${CATEGORY}/${PN} after each update to dev-lang/ruby or"
	elog "dev-lang/ruby-enterprise."
}
