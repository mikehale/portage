# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/virtual/postgresql-server/postgresql-server-8.2.ebuild,v 1.7 2010/01/08 01:27:17 beandog Exp $

EAPI="1"

DESCRIPTION="Virtual for PostgreSQL libraries"
HOMEPAGE="http://www.postgresql.org/"
SRC_URI=""

LICENSE="as-is"
SLOT="${PV}"
KEYWORDS="~alpha amd64 ~arm hppa ~ia64 ppc ~ppc64 ~s390 ~sh ~sparc x86 ~sparc-fbsd ~x86-fbsd"
IUSE=""

RDEPEND="|| ( dev-db/postgresql-server:${SLOT} =dev-db/postgresql-${PV}* )"
