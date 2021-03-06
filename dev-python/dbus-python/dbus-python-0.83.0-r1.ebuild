# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-python/dbus-python/dbus-python-0.83.0-r1.ebuild,v 1.19 2010/05/22 11:16:15 armin76 Exp $

EAPI="2"
PYTHON_DEPEND="2"
PYTHON_EXPORT_PHASE_FUNCTIONS="1"
SUPPORT_PYTHON_ABIS="1"

inherit multilib python

DESCRIPTION="Python bindings for the D-Bus messagebus."
HOMEPAGE="http://www.freedesktop.org/wiki/Software/DBusBindings \
http://dbus.freedesktop.org/doc/dbus-python/"
SRC_URI="http://dbus.freedesktop.org/releases/${PN}/${P}.tar.gz"

SLOT="0"
LICENSE="MIT"
KEYWORDS="alpha amd64 arm hppa ia64 ~mips ppc ppc64 sh sparc x86 ~x86-fbsd ~amd64-linux ~x86-linux"
IUSE="doc examples test"

RDEPEND="
	>=dev-libs/dbus-glib-0.71
	>=sys-apps/dbus-1.1.1"
DEPEND="${RDEPEND}
	doc? ( =dev-python/epydoc-3* )
	test? ( dev-python/pygobject )
	dev-util/pkgconfig"
RESTRICT_PYTHON_ABIS="3.*"

src_prepare() {
	# Disable compiling of .pyc files.
	mv py-compile py-compile.orig
	ln -s $(type -P true) py-compile

	python_src_prepare
}

src_configure() {
	use prefix || EPREFIX=

	configuration() {
		econf \
			--docdir="${EPREFIX}/usr/share/doc/${PF}" \
			$(use_enable doc api-docs)
	}
	python_execute_function -s configuration
}

src_install() {
	python_src_install

	if use doc; then
		install_documentation() {
			dohtml api/* || return 1
		}
		python_execute_function -f -q -s install_documentation
	fi

	if use examples; then
		insinto /usr/share/doc/${PF}/
		doins -r examples || die
	fi

	find "${D}" -name "*.la" -delete || die "removing *.la files failed"
}

pkg_postinst() {
	python_mod_optimize dbus
}

pkg_postrm() {
	python_mod_cleanup dbus
}
