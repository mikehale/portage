# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/app-emulation/ganeti-instance-debootstrap/ganeti-instance-debootstrap-0.8.ebuild,v 1.1 2010/03/07 21:03:00 ramereth Exp $

EAPI=2

inherit eutils

DESCRIPTION="Scripts to build Ganeti VMs with debootstrap"
HOMEPAGE="http://code.google.com/p/ganeti/"
SRC_URI="http://ganeti.googlecode.com/files/ganeti-instance-debootstrap-${PV}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="app-arch/dpkg
	app-arch/dump
	app-emulation/ganeti
	dev-util/debootstrap
	|| ( >=sys-apps/coreutils-6.10-r1 sys-apps/mktemp )
	sys-apps/util-linux
	sys-fs/e2fsprogs"

src_configure() {
	econf --docdir=/usr/share/doc/${P} || die "econf failed"
}

src_install() {
	emake DESTDIR="${D}" install || die "install failed"
}
