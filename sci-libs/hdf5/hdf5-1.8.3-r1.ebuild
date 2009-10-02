# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/sci-libs/hdf5/hdf5-1.8.3-r1.ebuild,v 1.3 2009/10/01 19:27:44 klausman Exp $

EAPI=2
inherit eutils autotools

DESCRIPTION="General purpose library and file format for storing scientific data"
HOMEPAGE="http://www.hdfgroup.org/HDF5/"
SRC_URI="http://www.hdfgroup.org/ftp/HDF5/current/src/${P}.tar.gz"

LICENSE="NCSA-HDF"
SLOT="0"
KEYWORDS="~alpha ~amd64 ~hppa ~ppc ~ppc64 ~sparc ~x86"

IUSE="cxx examples fortran mpi szip threads zlib"

RDEPEND="mpi? ( || (
			sys-cluster/openmpi[romio]
			sys-cluster/mpich2[romio]
			>=sys-cluster/lam-mpi-7.1.4[romio] ) )
	szip? ( >=sci-libs/szip-2.1 )
	zlib? ( sys-libs/zlib )"

DEPEND="${RDEPEND}
	>=sys-devel/libtool-2.2
	sys-process/time"

pkg_setup() {
	if use mpi && use cxx; then
		ewarn "Simultaneous mpi and cxx is not supported by ${PN}"
		ewarn "Will disable cxx interface"
	fi
	if use mpi && use fortran; then
		export FC=mpif90
	fi
}

src_prepare() {
	epatch "${FILESDIR}"/${P}-as-needed.patch
	epatch "${FILESDIR}"/${P}-includes.patch
	epatch "${FILESDIR}"/${P}-gnutools.patch
	epatch "${FILESDIR}"/${P}-noreturn.patch
	epatch "${FILESDIR}"/${P}-destdir.patch
	epatch "${FILESDIR}"/${P}-signal.patch

	# gentoo examples directory
	sed -i \
		-e 's:$(docdir)/hdf5:$(docdir):' \
		$(find . -name Makefile.am) || die
	eautoreconf
	# enable shared libs by default for h5cc config utility
	sed -i -e "s/SHLIB:-no/SHLIB:-yes/g" tools/misc/h5cc.in \
		|| die "sed h5cc.in failed"
}

src_configure() {
	# threadsafe incompatible with many options
	local myconf="--disable-threadsafe"
	use threads && ! use fortran && ! use cxx && ! use mpi \
		&& myconf="--enable-threadsafe"

	if use mpi && use cxx; then
		myconf="${myconf} --disable-cxx"
	elif use cxx; then
		myconf="${myconf} --enable-cxx"
	fi

	econf \
		--docdir=/usr/share/doc/${PF} \
		--disable-sharedlib-rpath \
		--enable-production \
		--enable-strict-format-checks \
		--enable-deprecated-symbols \
		$(use_enable fortran) \
		$(use_enable mpi parallel) \
		$(use_with szip szlib) \
		$(use_with threads pthread) \
		$(use_with zlib) \
		${myconf}
}

src_install() {
	emake DESTDIR="${D}" install || die "emake install failed"
	dodoc README.txt
	if use examples; then
		emake -j1 DESTDIR="${D}" install-examples \
			|| die "emake install examples failed"
	fi
}
