# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/app-portage/epm/epm-0.9.1.ebuild,v 1.3 2008/01/26 16:00:27 grobian Exp $

DESCRIPTION="rpm workalike for Gentoo Linux"
HOMEPAGE="http://www.gentoo.org/~agriffis/epm/"
SRC_URI="http://www.gentoo.org/~agriffis/epm/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="alpha amd64 arm hppa ia64 mips ppc ppc64 s390 sparc x86"
IUSE=""

DEPEND=">=dev-lang/perl-5"

src_compile() {
	pod2man epm > epm.1 || die "pod2man failed"
}

src_install() {
	dobin epm || die
	doman epm.1
}
