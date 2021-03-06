# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/www-client/w3m/w3m-0.5.2.ebuild,v 1.6 2007/10/15 15:10:51 corsair Exp $

inherit eutils

DESCRIPTION="Text based WWW browser, supports tables and frames"
HOMEPAGE="http://w3m.sourceforge.net/"
SRC_URI="mirror://sourceforge/w3m/${P}.tar.gz"

LICENSE="w3m"
SLOT="0"
KEYWORDS="alpha ~amd64 ia64 ppc ppc64 sparc x86"
IUSE="X fbcon gpm gtk imlib lynxkeymap migemo nls nntp ssl unicode xface linguas_ja"

# We cannot build w3m with gtk+2 w/o X because gtk+2 ebuild doesn't
# allow us to build w/o X, so we have to give up framebuffer w3mimg....
DEPEND=">=sys-libs/ncurses-5.2-r3
	>=sys-libs/zlib-1.1.3-r2
	>=dev-libs/boehm-gc-6.2
	X? ( x11-libs/libXext x11-libs/libXdmcp )
	gtk? ( >=x11-libs/gtk+-2 )
	!gtk? ( imlib? ( >=media-libs/imlib2-1.1.0 ) )
	xface? ( media-libs/compface )
	gpm? ( >=sys-libs/gpm-1.19.3-r5 )
	migemo? ( >=app-text/migemo-0.40 )
	ssl? ( >=dev-libs/openssl-0.9.6b )"
PROVIDE="virtual/w3m"

src_compile() {

	local myconf migemo_command imagelibval imageval

	if use gtk ; then
		imagelibval="gtk2"
	elif use imlib ; then
		imagelibval="imlib2"
	fi

	if [ ! -z "${imagelibval}" ] ; then
		use X && imageval="${imageval}${imageval:+,}x11"
		use X && use fbcon && imageval="${imageval}${imageval:+,}fb"
	fi

	if use migemo ; then
		migemo_command="migemo -t egrep /usr/share/migemo/migemo-dict"
	else
		migemo_command="no"
	fi

	# emacs-w3m doesn't like "--enable-m17n --disable-unicode,"
	# so we better enable or disable both. Default to enable
	# m17n and unicode, see bug #47046.
	if use linguas_ja ; then
		if use unicode ; then
			myconf="${myconf} --enable-japanese=U"
		else
			myconf="${myconf} --enable-japanese=E"
		fi
	elif use unicode ; then
		myconf="${myconf} --with-charset=UTF-8"
	else
		myconf="${myconf} --with-charset=US-ASCII"
	fi

	# lynxkeymap IUSE flag. bug #49397
	if use lynxkeymap ; then
		myconf="${myconf} --enable-keymap=lynx"
	else
		myconf="${myconf} --enable-keymap=w3m"
	fi

	econf \
		--with-editor=/usr/bin/vi \
		--with-mailer=/bin/mail \
		--with-browser=/usr/bin/firefox \
		--with-termlib=curses \
		--enable-image=${imageval:-no} \
		--with-imagelib="${imagelibval:-no}" \
		--with-migemo="${migemo_command}" \
		--enable-m17n \
		--enable-unicode \
		$(use_enable gpm mouse) \
		$(use_enable nls) \
		$(use_enable nntp) \
		$(use_enable ssl digest-auth) \
		$(use_with ssl) \
		$(use_enable xface) \
		${myconf} || die

	emake || die "emake failed"
}

src_install() {

	emake DESTDIR="${D}" install || die "emake install failed"

	insinto /usr/share/${PN}/Bonus
	doins Bonus/*
	dodoc README NEWS TODO ChangeLog
	docinto doc-en ; dodoc doc/*
	if use linguas_ja ; then
		docinto doc-jp ; dodoc doc-jp/*
	else
		rm -rf "${D}"/usr/share/man/ja
	fi
}
