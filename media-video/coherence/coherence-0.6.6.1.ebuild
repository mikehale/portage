# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/media-video/coherence/coherence-0.6.6.1.ebuild,v 1.4 2010/08/12 09:09:52 maekke Exp $

EAPI=2
inherit distutils

MY_P="Coherence-${PV}"

DESCRIPTION="Coherence is a framework written in Python for DLNA/UPnP components"
HOMEPAGE="https://coherence.beebits.net/"
SRC_URI="http://coherence.beebits.net/download/${MY_P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 ~ppc64 x86"
IUSE=""

# deps are not exact and need some work
DEPEND="dev-python/louie
	dev-python/twisted
	dev-python/twisted-web
	dev-python/configobj
	dev-python/gst-python
	dev-python/nevow"
RDEPEND="${DEPEND}
	dev-python/axiom
	dev-python/gdata
	dev-python/feedparser
	dev-lang/python[sqlite]
	dev-python/tagpy"

S="${WORKDIR}/${MY_P}"

src_install() {
	DOCS="docs/*"
	distutils_src_install
	newinitd "${FILESDIR}"/coherence-init coherence
}
