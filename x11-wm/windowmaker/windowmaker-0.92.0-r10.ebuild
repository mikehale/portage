# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/x11-wm/windowmaker/windowmaker-0.92.0-r10.ebuild,v 1.1 2010/08/25 12:42:48 grobian Exp $

EAPI=3

inherit autotools eutils gnustep-base flag-o-matic

PATCHVER=4
S=${WORKDIR}/${P/windowm/WindowM}

DESCRIPTION="The fast and light GNUstep window manager"
SRC_URI="ftp://ftp.windowmaker.info/pub/source/release/${P/windowm/WindowM}.tar.gz
	http://www.windowmaker.info/pub/source/release/WindowMaker-extra-0.1.tar.gz
	mirror://gentoo/${P}-patchset-${PATCHVER}.tar.bz2"
HOMEPAGE="http://www.windowmaker.info/"

IUSE="gif gnustep jpeg nls png tiff modelock +vdesktop xinerama"
DEPEND="x11-libs/libXv
	>=x11-libs/libXft-2.1.0
	x11-libs/libXt
	media-libs/fontconfig
	gif? ( >=media-libs/giflib-4.1.0-r3 )
	png? ( >=media-libs/libpng-1.2.1 )
	jpeg? ( >=media-libs/jpeg-6b:0 )
	tiff? ( >=media-libs/tiff-3.6.1-r2 )
	gnustep? ( >=gnustep-base/gnustep-make-2.0 )
	xinerama? ( x11-libs/libXinerama )"
RDEPEND="${DEPEND}
	nls? ( >=sys-devel/gettext-0.10.39 )"

SLOT="0"
LICENSE="GPL-2"
KEYWORDS="~alpha ~amd64 ~hppa ~mips ~ppc ~ppc64 ~sparc ~x86 ~x86-fbsd ~x86-interix ~amd64-linux ~x86-linux ~ppc-macos ~x86-macos ~sparc-solaris ~x64-solaris ~x86-solaris"

src_prepare() {
	cd "${S}"
	local psd="${WORKDIR}"/${P}-patchset-${PATCHVER}

	epatch "${psd}"/WindowMaker-0.92.0-cvs20060123.patch
	epatch "${psd}"/WindowMaker-0.92.0-cvs-gcc41.patch
	epatch "${psd}"/wlist-0.9x.patch
	epatch "${psd}"/${P}-gif-before-ungif.patch
	epatch "${psd}"/${P}-math_h.patch
	epatch "${psd}"/${P}-gettext.patch
	epatch "${psd}"/${P}-libpng14.patch

	# Patches from upstream HG
	epatch "${psd}"/${P}-composite-non-24bit-depth.patch
	epatch "${psd}"/${P}-mouse-window-focus.patch
	epatch "${psd}"/${P}-maximise-borderless-too-small.patch
	epatch "${psd}"/${P}-xinerama-switchpanel-corruption.patch
	epatch "${psd}"/${P}-dialog-history.patch
	epatch "${psd}"/${P}-single-click-dockapp-start.patch
	epatch "${psd}"/${P}-no-pop-empty-array.patch
	epatch "${psd}"/${P}-empty-command-fatal-error.patch
	epatch "${psd}"/${P}-findfile-overflow.patch
	epatch "${psd}"/${P}-pointer-integer-warn-fix.patch
	epatch "${psd}"/${P}-workspace-change-crash.patch
	epatch "${psd}"/${P}-app-icon-fix.patch
	epatch "${psd}"/${P}-xchangeproperty-64bits-fix.patch

	# Patches from altlinux
	epatch "${psd}"/WindowMaker-0.91.0-alt-session.patch
	epatch "${psd}"/WindowMaker-0.91.0-alt-restartscrpt.patch
	epatch "${psd}"/WindowMaker-0.91.0-alt-menutrans.patch
	epatch "${psd}"/WindowMaker-0.91.0-alt-titlebar.patch
	epatch "${psd}"/${P}-no-clip-title.patch
	epatch "${psd}"/WindowMaker-0.91.0-alt-mmx.patch
	epatch "${psd}"/WindowMaker-0.91.0-alt-focus.patch
	epatch "${psd}"/WindowMaker-0.92.0-alt-alloca.patch

	# New features (cool!)
	epatch "${psd}"/${P}-doubleclick-maximise.patch
	epatch "${psd}"/WindowMaker-0.91.0-alt-dockhotkeys.patch
	epatch "${psd}"/WindowMaker-0.91.0-alt-vlaad-trance.patch
	epatch "${psd}"/WindowMaker-0.91.0-alt-vlaad-newbuttons.patch
	epatch "${psd}"/WindowMaker-0.91.0-hmepas-minimizeall.patch
	epatch "${psd}"/WindowMaker-0.91.0-hmepas-swmenu_rclick.patch
	epatch "${psd}"/WindowMaker-0.91.0-sga-moving-add.patch
	epatch "${psd}"/WindowMaker-0.91.0-peter-newappicon.patch
	epatch "${psd}"/WindowMaker-0.91.0-peter-mouse-placement.patch
	epatch "${psd}"/WindowMaker-0.91.0-peter-appicon-bouncer2.patch
	epatch "${psd}"/WindowMaker-0.91.0-sga-swpanel-customization.patch
	epatch "${psd}"/WindowMaker-0.92.0-alt-newpo.patch

	[[ ${CHOST} == *-interix* ]] && epatch "${psd}"/${P}-interix3.patch
	epatch "${psd}"/${P}-darwin-setlocale.patch
	epatch "${psd}"/${P}-nls.patch

	# Add UK localisation
	cp "${psd}"/WindowMaker-uk.po po/uk.po
	cp "${psd}"/WPrefs-uk.po WPrefs.app/po/uk.po

	# Add newbuttons resources
	cp "${psd}"/WindowMaker-newbuttons.nextstyle.tiff \
		WPrefs.app/tiff/nextstyle.tiff
	cp "${psd}"/WindowMaker-newbuttons.oldstyle.tiff \
		WPrefs.app/tiff/oldstyle.tiff
	cp "${psd}"/WindowMaker-newbuttons.nextstyle.xpm \
		WPrefs.app/xpm/nextstyle.xpm

	# Fix some paths
	if use gnustep; then
		egnustep_env
	fi
	for file in "${S}"/WindowMaker/*menu*; do
		if [[ -r $file ]] ; then
			if use gnustep ; then
				sed -i -e "s:/usr/local/GNUstep/Applications:${GNUSTEP_SYSTEM_APPS}:g" "$file" || die
			else
				sed -i -e "s:/usr/local/GNUstep/Applications/WPrefs.app:${EPREFIX}/usr/bin/:g;" "$file" || die
			fi

			sed -i -e 's:/usr/local/share/WindowMaker:${EPREFIX}/usr/share/WindowMaker:g;' "$file" || die
			sed -i -e 's:/opt/share/WindowMaker:${EPREFIX}/usr/share/WindowMaker:g;' "$file" || die
		fi;
	done;

	eautoreconf || die "eautoreconf failed"
}

src_configure() {
	local myconf

	is-flag -fstack-protector && filter-flags -fstack-protector \
		&& ewarn "CFLAG -fstack-protector has been disabled, as it is known to cause bugs with WindowMaker (bug #78051)" && ebeep 2
	replace-flags "-Os" "-O2"
	replace-flags "-O3" "-O2"

	# image format types
	# xpm is provided by X itself
	myconf="--enable-xpm $(use_enable png) $(use_enable jpeg) $(use_enable gif) $(use_enable tiff)"

	# non required X capabilities
	myconf="${myconf} $(use_enable modelock) $(use_enable xinerama)"

	if use gnustep ; then
		egnustep_env
		# Gentoo installs everything in System, make sure configure
		# honors that.  Don't set --with-gnustepdir, configure is
		# borked, and GNUSTEP_LOCAL_ROOT takes precedence anyway.
		export GNUSTEP_LOCAL_ROOT=${GNUSTEP_SYSTEM_ROOT}
	fi

	if use nls; then
		[[ -z $LINGUAS ]] && export LINGUAS="`ls po/*.po | sed 's:po/\(.*\)\.po$:\1:'`"
	else
		myconf="${myconf} --disable-locale"
	fi

	# enable new features, need to be done via defines
	append-flags -DBOUNCE_APP -DNEWAPPICON
	use vdesktop && append-flags -DVIRTUAL_DESKTOP

	# default settings with $myconf appended
	econf \
		--sysconfdir="${EPREFIX}"/etc/X11 \
		--with-x \
		--enable-usermenu \
		--with-pixmapdir="${EPREFIX}"/usr/share/pixmaps \
		--with-nlsdir="${EPREFIX}"/usr/share/locale \
		${myconf} || die
	cd ../WindowMaker-extra-0.1
	econf || die "windowmaker-extra: configure has failed"
}

src_compile() {
	emake || die "windowmaker: make has failed"

	# WindowMaker Extra Package (themes and icons)
	cd ../WindowMaker-extra-0.1
	emake || die "windowmaker-extra: make has failed"
}

src_install() {
	emake DESTDIR="${D}" install || die "windowmaker: install has failed."

	dodoc AUTHORS BUGFORM BUGS ChangeLog COPYING* INSTALL* FAQ* \
		  MIRRORS README* NEWS TODO

	# WindowMaker Extra
	cd ../WindowMaker-extra-0.1
	emake DESTDIR="${D}" install || die "windowmaker-extra: install failed"

	newdoc README README.extra

	# create wmaker session shell script
	echo "#!/usr/bin/env bash" > wmaker
	echo "${EPREFIX}/usr/bin/wmaker" >> wmaker
	exeinto /etc/X11/Sessions/
	doexe wmaker

	insinto /etc/X11/dm/Sessions
	doins "${FILESDIR}"/wmaker.desktop
	make_desktop_entry /usr/bin/wmaker
}
