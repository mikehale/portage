# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-perl/crypt-cbc/crypt-cbc-2.30.ebuild,v 1.2 2010/01/09 19:02:20 grobian Exp $

MODULE_AUTHOR=LDS
MY_P=Crypt-CBC-${PV}
S=${WORKDIR}/${MY_P}

inherit perl-module

DESCRIPTION="Encrypt Data with Cipher Block Chaining Mode"

LICENSE="|| ( Artistic GPL-2 )"
SLOT="0"
KEYWORDS="~alpha ~amd64 ~hppa ~ia64 ~mips ~ppc ~ppc64 ~sparc ~x86 ~amd64-linux ~x86-linux ~ppc-macos ~x86-macos"
IUSE="test"

SRC_TEST="do"

RDEPEND="virtual/perl-Digest-MD5
	dev-lang/perl"
DEPEND="${RDEPEND}
	test? ( dev-perl/Crypt-Blowfish
		dev-perl/Crypt-DES
		dev-perl/crypt-idea )"
#		dev-perl/Crypt-Rijndael )"
