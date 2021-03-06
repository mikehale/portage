# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/net-mail/getmail/getmail-4.13.0.ebuild,v 1.2 2009/10/24 10:50:58 grobian Exp $

inherit distutils

DESCRIPTION="A POP3 mail retriever with reliable Maildir and mbox delivery"
HOMEPAGE="http://pyropus.ca/software/getmail/"
SRC_URI="http://pyropus.ca/software/getmail/old-versions/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="4"
KEYWORDS="~alpha ~amd64 ~ppc ~sparc ~x86 ~ppc-macos ~x86-macos ~x64-solaris"
IUSE=""

DEPEND=">=dev-lang/python-2.3.3"
RDEPEND="${DEPEND}"

PYTHON_MODNAME=getmailcore

src_install() {
	[[ -z ${ED} ]] && local ED=${D}
	distutils_src_install

	# handle docs the gentoo way
	rm "${ED}"/usr/share/doc/${P}/COPYING || die
	if [[ ${P} != ${PF} ]] ; then
		mv "${ED}"/usr/share/doc/${P} "${ED}"/usr/share/doc/${PF} || die
	fi

	dodir /usr/share/doc/${PF}/html
	mv "${ED}"/usr/share/doc/${PF}/*.{html,css} "${ED}"/usr/share/doc/${PF}/html || die
}
