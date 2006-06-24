# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit toolchain-funcs base

DESCRIPTION="ChuCK - On-the-fly Audio Programming"
HOMEPAGE="http://chuck.cs.princeton.edu/release/"
SRC_URI="http://chuck.cs.princeton.edu/release/files/${P}.tgz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86"
IUSE="oss jack alsa"

DEPEND="jack? ( media-sound/jack-audio-connection-kit )
	alsa? ( >=media-libs/alsa-lib-0.9 )
	media-libs/libsndfile
	sys-devel/bison
	sys-devel/flex"

PATCHES="${FILESDIR}/chuck-1.2.0.5-makefile.patch"

pkg_setup() {
	local cnt=0
	use jack && cnt="$((${cnt} + 1))"
	use alsa && cnt="$((${cnt} + 1))"
	use oss && cnt="$((${cnt} + 1))"
	if [[ "${cnt}" -ne 1 ]] ; then
		eerror "You have set ${P} to use multiple audio engine."
		eerror "I don't know which to use!"
		eerror "You can use /etc/portage/package.use to set per-package USE flags"
		eerror "Set it so only one audio engine type jack, alsa, oss"
		die "Please set only one audio engine type"
	fi
}

src_compile() {
	cd "${S}/src"

	local backend
	local flags
	if use jack ; then
		backend="jack"
		flags="JACK"
	elif use alsa ; then
		backend="alsa"
		flags="ALSA"
	elif use oss ; then
		backend="oss"
		flags="OSS"
	else
		einfo "One of the following USE flags is needed: jack, alsa or oss"
		die "One of the following USE flags is needed: jack, alsa or oss"
	fi
	einfo "Compiling against ${backend}"
	CXX="$(tc-getCC)" FLAGS="-D__LINUX_${flags}__ -c ${CFLAGS}" emake -j1 "linux-${backend}" || die "emake failed"
}

src_install() {
	dobin src/chuck

	dodoc AUTHORS DEVELOPER PROGRAMMER QUICKSTART README THANKS TODO VERSIONS
	docinto examples
	dodoc `find examples -type f`
	for dir in `find examples/* -type d`; do
		docinto $dir
		dodoc $dir/*
	done
	docinto doc
	dodoc doc/*
}
