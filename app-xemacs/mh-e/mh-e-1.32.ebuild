# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/app-xemacs/mh-e/mh-e-1.32.ebuild,v 1.1 2010/08/13 10:12:24 graaff Exp $

SLOT="0"
IUSE=""
DESCRIPTION="Front end support for MH."
PKG_CAT="standard"

RDEPEND="app-xemacs/gnus
app-xemacs/mail-lib
app-xemacs/xemacs-base
app-xemacs/rmail
app-xemacs/tm
app-xemacs/apel
app-xemacs/sh-script
app-xemacs/fsf-compat
app-xemacs/xemacs-devel
app-xemacs/net-utils
app-xemacs/xemacs-eterm
app-xemacs/os-utils
app-xemacs/ecrypto
app-xemacs/cedet-common
app-xemacs/speedbar
"
KEYWORDS="~alpha ~amd64 ~ppc ~ppc64 ~sparc ~x86"

inherit xemacs-packages
