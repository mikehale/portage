# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/app-benchmarks/siege/siege-2.67.ebuild,v 1.3 2009/11/19 04:10:25 jer Exp $

WANT_AUTOMAKE=1.9

inherit eutils bash-completion autotools

DESCRIPTION="A HTTP regression testing and benchmarking utility"
HOMEPAGE="http://www.joedog.org/JoeDog/Siege"
SRC_URI="ftp://sid.joedog.org/pub/${PN}/${P}.tar.gz"

LICENSE="GPL-2"
KEYWORDS="~amd64 hppa ~mips ~ppc ~x86"
SLOT="0"
IUSE="debug ssl"

DEPEND="ssl? ( >=dev-libs/openssl-0.9.6d )"

src_unpack() {
	unpack ${A}
	cd "${S}"

	# To make siege compile with libtool-2.2, from acinclude.m4 rip out the
	# included copy of libtool.m4 from libtool-1.5.2x so we use the host's
	# macros. We have to eautoreconf to make this work.
	sed -i \
		-e '/libtool.m4 - Configure libtool for the host system./,/])# AC_LTDL_FUNC_ARGZ/d' \
		acinclude.m4 \
		|| die "Sedding some sense into acinclude.m4 failed."
	epatch "${FILESDIR}/${PN}"-2.60-gentoo.diff

	# use of \b causes the T in "Transactions" to be displayed
	# on the last column of the previous line.
	sed -i 's/\\b\(Transactions:\)/\1/' src/main.c || \
		die "sed src/main.c failed"
	eautoreconf
}

src_compile() {
	local myconf
	use ssl && myconf="--with-ssl=/usr" || myconf="--without-ssl"

	econf ${myconf} \
		$(use_with debug debugging) \
		|| die "econf failed"

	emake || die "emake failed"
}

src_install() {
	make DESTDIR="${D}" install || die "make install failed"

	# bug 111057 - siege.config utility uses ${} which gets
	# interpreted by bash sending the contents to stderr
	# instead of ${HOME}/.siegerc
	sed -i -e 's|\${}|\\${}|' -e 's|\$(HOME)|\\$(HOME)|' \
		"${D}"/usr/bin/siege.config

	dodoc AUTHORS ChangeLog INSTALL MACHINES README* KNOWNBUGS \
		siegerc-example urls.txt || die "dodoc failed"
	dobashcompletion "${FILESDIR}/${PN}".bash-completion

	for x in $(find "${D}"/usr/bin -name '*.pl') ; do mv "${x}" "${x%.*}" ; done
}

pkg_postinst() {
	echo
	elog "An example ~/.siegerc file has been installed in"
	elog "/usr/share/doc/${PF}/"
	bash-completion_pkg_postinst
}
