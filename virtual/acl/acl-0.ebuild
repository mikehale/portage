# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/virtual/acl/acl-0.ebuild,v 1.2 2009/12/29 01:57:38 abcd Exp $

DESCRIPTION="Virtual for acl support (sys/acl.h)"
HOMEPAGE=""
SRC_URI=""

LICENSE=""
SLOT="0"
KEYWORDS="alpha amd64 arm hppa ia64 m68k ~mips ppc ppc64 s390 sh sparc x86 ~x86-fbsd ~amd64-linux ~ia64-linux ~x86-linux"
IUSE=""

DEPEND=""
RDEPEND="kernel_linux? ( sys-apps/acl )
	kernel_FreeBSD? ( sys-freebsd/freebsd-lib )"
