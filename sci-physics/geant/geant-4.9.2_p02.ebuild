# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/sci-physics/geant/geant-4.9.2_p02.ebuild,v 1.8 2010/08/12 16:26:56 bicatali Exp $

EAPI=2

inherit eutils versionator toolchain-funcs

PV1=$(get_version_component_range 1 ${PV})
PV2=$(get_version_component_range 2 ${PV})
PV3=$(get_version_component_range 3 ${PV})
MY_P=${PN}$(replace_version_separator 3 .)

DESCRIPTION="Toolkit for simulation of passage of particles through matter"
HOMEPAGE="http://geant4.cern.ch/"

SRC_COM="http://geant4.web.cern.ch/geant4/support/source"
SRC_URI="${SRC_COM}/${MY_P}.tar.gz"
GEANT4_DATA="G4NDL.3.13
	G4EMLOW.6.2
	G4RadioactiveDecay.3.2
	PhotonEvaporation.2.0
	G4ABLA.3.0"
for d in ${GEANT4_DATA}; do
	SRC_URI="${SRC_URI} data? ( ${SRC_COM}/${d}.tar.gz )"
done

LICENSE="geant4"
SLOT="4"
KEYWORDS="amd64 hppa sparc x86"
IUSE="aida athena +data dawn debug examples gdml geant3 global minimal +motif
	+opengl openinventor qt4 +raytracerx static +vrml zlib"

RDEPEND="<sci-physics/clhep-2.1
	motif? ( x11-libs/openmotif )
	athena? ( x11-libs/libXaw )
	qt4? ( x11-libs/qt-gui:4 )
	openinventor? ( >=media-libs/openinventor-2.1.5.10-r3 )
	raytracerx? ( x11-libs/libX11 x11-libs/libXmu )
	opengl? ( virtual/opengl
			  athena? ( x11-libs/Xaw3d )
			  qt4? ( x11-libs/qt-opengl:4 ) )
	gdml? ( dev-libs/xerces-c )
	geant3? ( sci-physics/geant:3 )
	dawn? ( media-gfx/dawn )
	zlib? ( sys-libs/zlib )"

DEPEND="${RDEPEND}"

S="${WORKDIR}/${MY_P}"

pkg_setup() {
	eval unset ${!G4*}
}

src_prepare() {
	# fix bad zlib dependency
	epatch "${FILESDIR}"/${PN}-4.9.2-zlib.patch

	# propagate user's flags and compiler settings
	sed -i -e 's/-o/$(LDFLAGS) -o/g' source/GNUmakefile || die
	sed -i \
		-e '/CXX.*:=.*g++/d' \
		-e '/FC.*:=.*gfortran/d' \
		-e 's/\(CXXFLAGS.*:=\).*/\1 -ansi/' \
		-e '/CXXFLAGS.*+=.*pipe/d' \
		-e "/CXXFLAGS.*=.*-O2/s:=.*:= ${CXXFLAGS}:" \
		-e "/FCFLAGS.*=.*-O2/s:=.*:= ${FCFLAGS}:" \
		-e "/CCFLAGS.*=.*-O2/s:=.*:= ${CFLAGS}:" \
		-e "s:-Wl,-soname:${LDFLAGS} -Wl,-soname:g" \
		-e "s/libq\*/lib\[q,Q\]t*/g" \
		config/sys/Linux*gmk || die "flag substitution failed"
	sed -i \
		-e 's:g++:$(CXX):g' \
		config/*.gmk || die "sed for forced g++ failed"

	# fix forced lib directory
	sed -i \
		-e 's:$(G4LIB)/$(G4SYSTEM):$(G4LIB):g' \
		config/binmake.gmk || die "sed binmake.gmk failed"
	sed -i \
		-e '/$(G4LIB)\/$(G4SYSTEM)/d' \
		config/architecture.gmk || die "sed architecture.gmk failed"
	sed -i \
		-e 's:$(G4LIB)/$(G4SYSTEM):$(G4TMP):g' \
		config/common.gmk || die "sed common.gmk failed"
	sed -i \
		-e 's:$(G4LIB)/$(G4SYSTEM):$(G4TMP):g' \
		config/moc.gmk || die "sed moc.gmk failed"
	sed -i \
		-e 's:$(G4LIB)/$(G4SYSTEM):$(G4TMP):g' \
		-e 's:$(G4BIN)/$(G4SYSTEM):$(G4TMP):g' \
		-e 's:$(G4TMP)/$(G4SYSTEM):$(G4TMP):g' \
		source/GNUmakefile || die "sed GNUmakefile failed"
	sed -i \
		-e 's:$(G4LIB)/$(G4SYSTEM):$(G4TMP):g' \
		config/globlib.gmk || die "sed globlib.gmk failed"

	# work around a non defined fortran compiler
	use geant3 && export FC=$(tc-getFC)
	# don't worry about the g++ name of the file, we remove all specific
	export G4SYSTEM=Linux-g++
}

src_configure() {
	export GEANT4_DIR="/usr/share/${PN}${PV1}"
	# where to put compiled libraries;
	# we set env var G4LIB in src_install()
	# to avoid confusing make
	export GEANT4_LIBDIR=/usr/$(get_libdir)/${PN}${PV1}
	export G4INSTALL="${S}"
	export G4WORKDIR="${S}"
	export G4INCLUDE="${D}/usr/include/${PN}"
	export CLHEP_BASE_DIR=/usr

	# parse USE; just set flags of drivers to build, G4*_USE_* vars are set
	# later automatically for G4*_BUILD_*_DRIVER
	use minimal             && export G4UI_NONE=y \
							&& export G4VIS_NONE=y

	use motif               && export G4UI_BUILD_XM_SESSION=y
	use athena              && export G4UI_BUILD_XAW_SESSION=y
	if use qt4; then
		export G4UI_BUILD_QT_SESSION=y
		export QTLIBS="-L/usr/$(get_libdir)/qt4 -lQtCore -lQtGui"
		export QTFLAGS="-I/usr/include/qt4 -I/usr/include/qt4/Qt"
		use opengl && \
			export GLQTLIBS="${QTLIBS} -lQtOpenGL"
		#export QTFLAGS="${QTFLAGS} -I/usr/include/qt4/QtOpenGL"
	fi
	use dawn                && export G4VIS_BUILD_DAWN_DRIVER=y
	use raytracerx          && export G4VIS_BUILD_RAYTRACERX_DRIVER=y
	use openinventor        && export G4VIS_BUILD_OI_DRIVER=y
	use opengl              && export G4VIS_BUILD_OPENGLX_DRIVER=y
	use opengl && use motif && export G4VIS_BUILD_OPENGLXM_DRIVER=y
	use gdml                && export G4LIB_BUILD_GDML=y
	use geant3              && export G4LIB_BUILD_G3TOG4=y
	use zlib                && export G4LIB_USE_ZLIB=y
	use vrml                && export G4VIS_BUILD_VRML_DRIVER=y \
							&& export G4VIS_BUILD_VRMLFILE_DRIVER=y
	use aida                && export G4ANALYSIS_USE=y
	use data                && export G4DATA="${GEANT4_DIR}/data"
	use debug               && export G4DEBUG=y || export G4OPTIMIZE=y

	# switch to see compiling flags
	export CPPVERBOSE=y

	# if shared libs are built, the script will also build static libs
	# with pic flags
	# avoid that by building it twice and removing temporary objects
	export G4LIB_BUILD_SHARED=y
}

src_compile() {
	cd "${S}/source/"
	einfo "Building shared library"
	emake || die "Building shared geant failed"

	if use global; then
		export G4LIB_USE_GRANULAR=y
		einfo "Building granular libraries"
		emake global || die "Building global libraries failed"
		emake || die "Rebuilding shared geant failed"
	fi

	if use static; then
		einfo "Building static libraries"
		rm -rf tmp
		export G4LIB_BUILD_STATIC=y ; unset G4LIB_BUILD_SHARED
		emake || die "Building static geant failed"
	fi
}

g4_create_env_script() {
	# we need to change some variables to the final values since we hide these
	# from make during the compile
	export G4INSTALL=${GEANT4_DIR}
	export G4LIB=${GEANT4_LIBDIR}
	export G4INCLUDE=${G4INCLUDE/${D}/}
	export G4WORKDIR=\${HOME}/${PN}${PV1}

	local g4env=99${PN}${PV1}
	cat <<-EOF > ${g4env}
		LDPATH=${G4LIB}
		CLHEP_BASE_DIR=${CLHEP_BASE_DIR}
	EOF

	# detailed data file locations
	if use data; then
		G4LEVELGAMMADATA="${G4DATA}/$(basename ${WORKDIR}/PhotonEvaporation*)"
		G4RADIOACTIVEDATA="${G4DATA}/$(basename ${WORKDIR}/RadioactiveDecay*)"
		G4LEDATA="${G4DATA}/$(basename ${WORKDIR}/G4EMLOW*)"
		G4ABLADATA="${G4DATA}/$(basename ${WORKDIR}/G4ABLA*)"
		G4NEUTRONHPCROSSSECTIONS="${G4DATA}/$(basename ${WORKDIR}/G4NDL*)"
		export G4LEVELGAMMADATA G4RADIOACTIVEDATA G4LEDATA \
			G4ABLADATA G4NEUTRONHPCROSSSECTIONS
	fi

	# read env variables defined upto now
	printenv | grep ^G4 | uniq >> ${g4env}
	# define env vars for capabilities we can build into user projects
	printenv | uniq | \
		sed -n -e '/^G4/s:BUILD\(.*\)_DRIVER:USE\1:gp' >> ${g4env}
	doenvd ${g4env} || die "Installing environment scripts failed "
}

src_install() {
	# install headers via make since we want them in a single directory
	cd "${S}/source/"
	einfo "Installing Geant4 headers"
	emake includes || die 'Installing headers failed'
	cd "${S}"

	# but install libraries and Geant library tool manually
	einfo "Installing Geant4 libraries"
	insinto ${GEANT4_LIBDIR}
	insopts -m0755
	doins tmp/*.so || die
	doins tmp/libname.map || die
	insopts -m0644
	if use static; then
		doins tmp/*.a || die
	fi
	exeinto ${GEANT4_LIBDIR}
	doexe tmp/liblist || die

	g4_create_env_script

	# configs
	insinto ${GEANT4_DIR}
	doins -r config || die

	# install data
	if use data; then
		einfo "Installing Geant4 data"
		insinto ${G4DATA}
		pushd "${WORKDIR}" > /dev/null
		for d in ${GEANT4_DATA}; do
			local p=${d/.}
			doins -r *${p/G4} || die "installing data ${d} failed"
		done
		popd > /dev/null
	fi

	# doc and examples
	insinto /usr/share/doc/${PF}
	local mypv="${PV1}.${PV2}.${PV3}"
	doins ReleaseNotes/ReleaseNotes${mypv}.html
	[[ -e ReleaseNotes/Patch${mypv}-1.txt ]] && \
		dodoc ReleaseNotes/Patch${mypv}-*.txt

	use examples && doins -r examples
	# TODO: * momo with momo or java flag, and check java stuff
}

pkg_postinst() {
	elog "Geant4 projects are by default build in \$HOME/geant4."
	elog "If you want to change, set \$G4WORKDIR to another directory."
}
