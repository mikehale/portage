# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-java/xml-commons-external/xml-commons-external-1.3.04.ebuild,v 1.10 2010/07/16 19:38:04 grobian Exp $

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-ant-2

DESCRIPTION="An Apache-hosted set of externally-defined standards interfaces, namely DOM, SAX, and JAXP."
HOMEPAGE="http://xml.apache.org/commons/"
SRC_URI="mirror://gentoo/${P}.tar.bz2"
# upstream source tar.gz is missing build.xml and other stuff, so we get it like this
# svn export http://svn.apache.org/repos/asf/xml/commons/tags/xml-commons-external-1_3_04/java/external/ xml-commons-external-1.3.04
# tar cjf xml-commons-external-1.3.04.tar.bz2 xml-commons-external-1.3.04

LICENSE="Apache-2.0"
SLOT="1.3"
KEYWORDS="amd64 ia64 ppc ppc64 x86 ~x86-fbsd ~x86-freebsd ~amd64-linux ~x86-linux ~ppc-macos ~x64-macos ~x86-macos ~sparc-solaris ~sparc64-solaris ~x64-solaris ~x86-solaris"
IUSE="doc source"

DEPEND=">=virtual/jdk-1.3"
RDEPEND=">=virtual/jre-1.3"

src_install() {
	java-pkg_dojar build/xml-apis.jar build/xml-apis-ext.jar

	dodoc NOTICE README.* || die

	if use doc; then
		java-pkg_dojavadoc build/docs/javadoc
		java-pkg_dohtml -r build/docs/dom
	fi
	use source && java-pkg_dosrc src/javax src/org
}
