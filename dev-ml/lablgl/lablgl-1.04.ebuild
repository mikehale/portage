# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-ml/lablgl/lablgl-1.04.ebuild,v 1.6 2009/10/12 23:14:30 jer Exp $

EAPI="2"

inherit multilib eutils toolchain-funcs

IUSE="doc glut +ocamlopt tk"

DESCRIPTION="Objective CAML interface for OpenGL"
HOMEPAGE="http://wwwfun.kurims.kyoto-u.ac.jp/soft/olabl/lablgl.html"
LICENSE="BSD"

RDEPEND=">=dev-lang/ocaml-3.10.2[tk?,ocamlopt?]
	virtual/opengl
	x11-libs/libXext
	x11-libs/libXmu
	x11-libs/libX11
	glut? ( virtual/glut )
	tk? ( >=dev-lang/tcl-8.3
	>=dev-lang/tk-8.3 )"
DEPEND="${RDEPEND}"

SRC_URI="http://wwwfun.kurims.kyoto-u.ac.jp/soft/olabl/dist/${P}.tar.gz"
SLOT="0"
KEYWORDS="alpha amd64 hppa ia64 ppc sparc x86 ~x86-fbsd"
S=${WORKDIR}/lablGL-${PV}

src_configure() {
	# make configuration file
	echo "BINDIR=/usr/bin" > Makefile.config
	echo "GLLIBS = -lGL -lGLU" >> Makefile.config
	if use glut; then
		echo "GLUTLIBS = -lglut" >> Makefile.config
	else
		echo "GLUTLIBS = " >> Makefile.config
	fi
	echo "XLIBS = -lXext -lXmu -lX11" >> Makefile.config
	echo "RANLIB = $(tc-getRANLIB)" >> Makefile.config
	echo 'COPTS = -c -O $(CFLAGS)' >> Makefile.config
	echo 'INCLUDES = $(TKINCLUDES) $(GLINCLUDES) $(XINCLUDES)' >> Makefile.config
}

src_compile() {
	if use tk; then
		emake -j1 togl || die "failed to build togl"
		if use ocamlopt; then
			emake -j1 toglopt || die "failed to build native code togl"
		fi
	fi

	emake -j1 lib || die "failed to build the library"
	if use ocamlopt; then
		emake -j1 libopt || die "failed to build native code library"
	fi

	if use glut; then
		emake -j1 glut || die "failed to build glut"
		if use ocamlopt; then
			emake -j1 glutopt || die "failed to build native code glutopt"
		fi
	fi
}

src_install () {
	# Makefile do not use mkdir so the library is not installed
	# but copied as a 'stublibs' file.
	dodir /usr/$(get_libdir)/ocaml/stublibs

	# Same for lablglut's toplevel
	dodir /usr/bin

	BINDIR=${D}/usr/bin
	BASE=${D}/usr/$(get_libdir)/ocaml
	emake BINDIR="${BINDIR}" INSTALLDIR="${BASE}/lablGL" DLLDIR="${BASE}/stublibs" install || die "make install failed"

	dodoc README CHANGES

	if use doc ; then
		insinto /usr/share/doc/${PF}
		mv Togl/examples{,.togl}
		doins -r Togl/examples.togl

		mv LablGlut/examples{,.glut}
		doins -r LablGlut/examples.glut
	fi
}
