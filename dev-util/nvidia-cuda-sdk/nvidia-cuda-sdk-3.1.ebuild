# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-util/nvidia-cuda-sdk/nvidia-cuda-sdk-3.1.ebuild,v 1.1 2010/07/03 22:56:46 spock Exp $

EAPI=2

inherit eutils toolchain-funcs

DESCRIPTION="NVIDIA CUDA Software Development Kit"
HOMEPAGE="http://developer.nvidia.com/cuda"

CUDA_V=${PV//_/-}
DIR_V=${CUDA_V//./_}
DIR_V=${DIR_V//beta/Beta}

SRC_URI="http://developer.download.nvidia.com/compute/cuda/${DIR_V}/sdk/gpucomputingsdk_${CUDA_V}_linux.run"
LICENSE="CUDPP"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="debug +doc +examples opencl +cuda"

RDEPEND=">=dev-util/nvidia-cuda-toolkit-3.1
	examples? ( >=x11-drivers/nvidia-drivers-256.35 )
	virtual/glut"
DEPEND="${RDEPEND}"

S="${WORKDIR}"

RESTRICT="binchecks"

src_unpack() {
	unpack_makeself
}

src_compile() {
	if ! use examples; then
		return
	fi
	local myopts=""

	if use debug; then
		myopts="${myopts} dbg=1"
	fi

	cd "${S}/sdk"

	if use cuda; then
		cd C
		emake cuda-install=/opt/cuda ${myopts} || die
		cd ..
	fi

	if use opencl; then
		cd OpenCL
		emake || die
		cd ..
	fi
}

src_install() {
	cd "${S}/sdk"

	if ! use doc; then
		rm -rf *.txt doc */doc */Samples.htm */releaseNotesData
	fi

	if ! use examples; then
		rm -rf bin */bin */tools
	fi

	for f in $(find .); do
		local t="$(dirname ${f})"
		if [[ "${t/obj\/}" != "${t}" || "${t##*.}" == "a" ]]; then
			continue
		fi

		if [[ -x "${f}" && ! -d "${f}" ]]; then
			exeinto "/opt/cuda/sdk/${t}"
			doexe "${f}"
		else
			insinto "/opt/cuda/sdk/${t}"
			doins "${f}"
		fi
	done
}
