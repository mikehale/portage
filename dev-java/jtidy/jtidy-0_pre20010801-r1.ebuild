# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-java/jtidy/jtidy-0_pre20010801-r1.ebuild,v 1.6 2009/05/17 17:11:42 nelchael Exp $

JAVA_PKG_IUSE="doc source"

inherit eutils base java-pkg-2 java-ant-2

MY_PV="04aug2000r7"
DESCRIPTION="Tidy is a Java port of HTML Tidy , a HTML syntax checker and pretty printer."
HOMEPAGE="http://jtidy.sourceforge.net/"
SRC_URI="mirror://sourceforge/${PN}/${PN}-${MY_PV}-dev.zip"
LICENSE="Apache-1.1"
SLOT="0"
KEYWORDS="amd64 ~ia64 ppc x86 ~x86-fbsd"
IUSE=""
DEPEND=">=virtual/jdk-1.4
	app-arch/unzip
	dev-java/ant-core"
RDEPEND=">=virtual/jre-1.4"

S=${WORKDIR}/${PN}-${MY_PV}-dev

PATCHES="${FILESDIR}/${PN}-source-1.4.patch"

src_compile() {
	eant jar # Has javadoc premade
}

src_install() {
	java-pkg_dojar build/Tidy.jar

	use doc && java-pkg_dojavadoc doc/api
	use source && java-pkg_dosrc src/org
}
