# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/app-emulation/bochs/bochs-2.3.ebuild,v 1.10 2010/02/10 06:32:50 dirtyepic Exp $

inherit eutils wxwidgets autotools

DESCRIPTION="a LGPL-ed pc emulator"
HOMEPAGE="http://bochs.sourceforge.net/"
SRC_URI="mirror://sourceforge/bochs/${P}.tar.gz
	 http://bochs.sourceforge.net/guestos/dlxlinux4.tar.gz"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="alpha amd64 ppc ~sparc x86"
IUSE="debugger readline sdl wxwidgets X ncurses vnc"

RDEPEND="X? ( x11-libs/libICE
		x11-libs/libSM
		x11-libs/libX11
		x11-libs/libXpm )
	sdl? ( media-libs/libsdl )
	wxwidgets? ( =x11-libs/wxGTK-2.6* )
	readline? ( sys-libs/readline )
	ncurses? ( sys-libs/ncurses )"

DEPEND="${RDEPEND}
	X? ( x11-proto/xproto )
	>=sys-apps/sed-4
	>=app-text/opensp-1.5"

src_unpack() {
	unpack ${P}.tar.gz
	cd ${S}
	sed -i \
		-e "s:\$(WGET) \$(DLXLINUX_TAR_URL):cp ${DISTDIR}/dlxlinux4.tar.gz .:" \
		-e "s:BOCHSDIR=:BOCHSDIR=/usr/$(get_libdir)/bochs#:" \
		-e 's: $(BOCHSDIR): $(DESTDIR)$(BOCHSDIR):g' Makefile.in || \
			die "sed Makefile.in failed"

# Make it use the correct path to gtk-2
	sed -i -e "s:/opt/gnome:/usr:" configure
# Fix some bad coding for gcc-4.1 compliance
	sed -i -e "s:\#ifndef PARANOID:\#if 0:" iodev/hdimage.h
# wx unicode patches from fedora and bits the fedora missed
#	epatch ${DISTDIR}/${P}-unicode.patch.gz
	epatch ${FILESDIR}/${P}-redog.patch
	epatch ${FILESDIR}/${P}-floppy.patch
	epatch ${FILESDIR}/${P}-ne2k.patch
	eautoconf
}

src_compile() {
	WX_GTK_VER=2.6

	use wxwidgets && \
		need-wxwidgets ansi

	[[ "$ARCH" == "x86" ]] \
		&& myconf="--enable-idle-hack --enable-fast-function-calls"
	myconf="${myconf} `use_with sdl`"
	myconf="${myconf} `use_enable readline`"
	use wxwidgets && \
		myconf="${myconf} --with-wx"
	use wxwidgets || \
		myconf="${myconf} --without-wx"
	use debugger && \
		myconf="$myconf --enable-debugger --enable-disasm \
				--enable-x86-debugger --enable-iodebug"
	use debugger || \
		myconf="$myconf --enable-gdb-stub"
	use vnc && \
		myconf="$myconf --with-rfb"

	use X && \
		myconf="$myconf --with-x11"

	use ncurses && \
		myconf="$myconf --with-term"

	if ! use X && ! use ncurses && ! use vnc && ! use sdl
	then
		myconf="$myconf --with-nogui"
	fi

	./configure \
		--enable-usb --enable-pci --enable-vbe \
		--enable-sse=2 --enable-3dnow --enable-plugins \
		--enable-cpu-level=6 --enable-all-optimizations \
		--enable-ne2000 --enable-sb16=linux --enable-clgd54xx \
		--enable-apic --enable-compressed-hd \
		--enable-pni --enable-sep --host=${CHOST} \
		--libdir=/usr/$(get_libdir) --prefix=/usr \
		${myconf} || die "configure failed"

	emake || die "emake failed"
}

src_install() {
	make DESTDIR=${D} install unpack_dlx || die "make install failed"
	#workaround
	make prefix=${D}/usr install_dlx

	dodoc CHANGES README TESTFORM.txt || die "dodoc failed"
}
