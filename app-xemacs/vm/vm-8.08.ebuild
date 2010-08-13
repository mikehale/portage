# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/app-xemacs/vm/vm-8.08.ebuild,v 1.1 2010/08/13 07:32:38 graaff Exp $

SLOT="0"
IUSE=""
DESCRIPTION="An Emacs mailer."
PKG_CAT="standard"

RDEPEND="app-xemacs/xemacs-base
app-xemacs/mail-lib
app-xemacs/gnus
app-xemacs/pgg
app-xemacs/ecrypto
app-xemacs/xemacs-eterm
app-xemacs/sh-script
app-xemacs/net-utils
app-xemacs/ps-print
app-xemacs/os-utils
app-xemacs/bbdb
app-xemacs/fsf-compat
"
KEYWORDS="~alpha ~amd64 ~ppc ~ppc64 ~sparc ~x86"

inherit xemacs-packages
