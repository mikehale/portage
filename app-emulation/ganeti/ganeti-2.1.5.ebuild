# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/app-emulation/ganeti/ganeti-2.1.5.ebuild,v 1.1 2010/07/02 22:56:07 ramereth Exp $

EAPI=2

inherit eutils confutils bash-completion

MY_PV="${PV/_rc/~rc}"
MY_P="${PN}-${MY_PV}"
DESCRIPTION="Ganeti is a virtual server management software tool"
HOMEPAGE="http://code.google.com/p/ganeti/"
SRC_URI="http://ganeti.googlecode.com/files/${MY_P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="kvm xen drbd +filestorage syslog"

S="${WORKDIR}/${MY_P}"

DEPEND="xen? ( >=app-emulation/xen-3.0 )
	kvm? ( app-emulation/qemu-kvm )
	drbd? ( >=sys-cluster/drbd-8.0 )
	dev-libs/openssl
	dev-python/pyopenssl
	dev-python/pyparsing
	dev-python/pyinotify
	dev-python/simplejson
	net-analyzer/arping
	net-misc/bridge-utils
	net-misc/openssh
	net-misc/socat
	sys-apps/iproute2
	sys-fs/lvm2"
RDEPEND="${DEPEND}"

pkg_setup () {
	confutils_require_any kvm xen
}

src_configure () {
	local myconf
	if use filestorage ; then
		myconf="--with-file-storage-dir=/var/lib/ganeti-storage/file"
	else
		myconf="--with-file-storage-dir=no"
	fi
	econf --localstatedir=/var \
		--docdir=/usr/share/doc/${P} \
		--with-ssh-initscript=/etc/init.d/sshd \
		--with-export-dir=/var/lib/ganeti-storage/export \
		--with-os-search-path=/usr/share/ganeti/os \
		$(use_enable syslog) \
		${myconf}
}

src_install () {
	emake DESTDIR="${D}" install || die "emake install failed"
	newinitd "${FILESDIR}"/ganeti-2.1.initd ganeti
	newconfd "${FILESDIR}"/ganeti.confd ganeti
	dobashcompletion doc/examples/bash_completion ganeti
	dodoc INSTALL NEWS README doc/*.rst
	rm -rf "${D}"/usr/share/doc/ganeti
	docinto examples
	dodoc doc/examples/{dumb-allocator,ganeti.cron,gnt-config-backup}
	docinto examples/hooks
	dodoc doc/examples/hooks/{ipsec,ethers}

	keepdir /var/{lib,log,run}/ganeti/
	keepdir /usr/share/ganeti/os/
	keepdir /var/lib/ganeti-storage/{export,file}/
}

pkg_postinst () {
	bash-completion_pkg_postinst
}
