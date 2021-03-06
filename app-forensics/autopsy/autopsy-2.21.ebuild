# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/app-forensics/autopsy/autopsy-2.21.ebuild,v 1.1 2009/03/08 16:46:20 patrick Exp $

inherit eutils

DESCRIPTION="A graphical interface to the digital forensic analysis tools in The Sleuth Kit."
HOMEPAGE="http://www.sleuthkit.org/autopsy/"
SRC_URI="mirror://sourceforge/autopsy/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~arm ~hppa ~ppc ~s390 ~sparc ~x86"
IUSE=""

# Runtime depend on grep and file deliberate
RDEPEND=">=dev-lang/perl-5.8.0
	>=app-forensics/sleuthkit-3.0.0
	sys-apps/grep
	sys-apps/file"
DEPEND=""

src_compile() {
	./configure 2>&1 >/dev/null << EOF
n
/tmp
EOF

	echo "#!/usr/bin/perl -wT" > autopsy
	echo "use lib '/usr/lib/autopsy/';" >> autopsy
	echo "use lib '/usr/lib/autopsy/lib/';" >> autopsy
	cat base/autopsy.base >> autopsy

	sed -i 's:conf.pl:/etc/autopsy.pl:' $(grep -lr conf\.pl ./)
	sed -i "s:INSTALLDIR = .*:INSTALLDIR = \'/usr/lib/autopsy\';:" conf.pl
}

src_install() {
	insinto /usr/lib/autopsy
	doins autopsy
	doins global.css
	insinto /usr/lib/autopsy/help
	doins help/*
	insinto /usr/lib/autopsy/lib
	doins lib/*
	insinto /usr/lib/autopsy/pict
	doins pict/*
	insinto /etc
	newins conf.pl autopsy.pl

	dodir /usr/bin
	dosym /usr/lib/autopsy/autopsy /usr/bin/autopsy
	fperms +x /usr/lib/autopsy/autopsy

	doman $(find man/ -type f)
	dodoc CHANGES.txt README* TODO.txt docs/sleuthkit-informer*.txt
}
