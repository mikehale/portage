# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/perl-core/Module-Build/Module-Build-0.36.01.ebuild,v 1.9 2010/02/23 15:44:14 josejx Exp $

EAPI=2

inherit versionator
MODULE_AUTHOR=DAGOLDEN
MY_P=${PN}-$(delete_version_separator 2)
S=${WORKDIR}/${MY_P}
inherit perl-module

DESCRIPTION="Build and install Perl modules"

SLOT="0"
KEYWORDS="~alpha ~amd64 ~arm ~hppa ~ia64 ~m68k ~ppc ~ppc64 ~s390 ~sh ~sparc ~x86 ~sparc-fbsd ~x86-fbsd ~x86-freebsd ~x86-interix ~amd64-linux ~ia64-linux ~x86-linux ~ppc-macos ~x64-macos ~x86-macos ~m68k-mint ~sparc-solaris ~sparc64-solaris ~x64-solaris ~x86-solaris"
IUSE=""

DEPEND="dev-perl/YAML-Tiny
	>=virtual/perl-ExtUtils-CBuilder-0.27
	>=virtual/perl-Archive-Tar-1.09
	>=virtual/perl-Test-Harness-3.16"
RDEPEND="${DEPEND}"
PDEPEND=">=virtual/perl-ExtUtils-ParseXS-2.21"

SRC_TEST="do"
