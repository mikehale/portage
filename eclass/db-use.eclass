# Copyright 1999-2004 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/eclass/db-use.eclass,v 1.8 2009/11/24 05:24:20 robbat2 Exp $
# This is a common location for functions that aid the use of sys-libs/db
#
# Bugs: pauldv@gentoo.org

inherit versionator multilib

#Convert a version to a db slot
db_ver_to_slot() {
	if [ $# -ne 1 ]; then
		eerror "Function db_ver_to_slot needs one argument" >&2
		eerror "args given:" >&2
		for f in $@
		do
			eerror " - \"$@\"" >&2
		done
		return 1
	fi
	echo -n "${1/.0/}"
}

#Find the version that correspond to the given atom
db_findver() {
	if [ $# -ne 1 ]; then
		eerror "Function db_findver needs one argument" >&2
		eerror "args given:" >&2
		for f in $@
		do
			eerror " - \"$@\"" >&2
		done
		return 1
	fi

	PKG="$(best_version $1)"
	VER="$(get_version_component_range 1-2 "${PKG/*db-/}")"
	if [ -d /usr/include/db$(db_ver_to_slot "$VER") ]; then
		#einfo "Found db version ${VER}" >&2
		echo -n "$VER"
		return 0
	else
		return 1
	fi
}

# Get the include dir for berkeley db.
# This function has two modes. Without any arguments it will give the best
# version available. With arguments that form the versions of db packages
# to test for, it will aim to find the library corresponding to it.

db_includedir() {
	if [ $# -eq 0 ]; then
		VER="$(db_findver sys-libs/db)" || return 1
		VER="$(db_ver_to_slot "$VER")"
		echo "include version ${VER}" >&2
		if [ -d "/usr/include/db${VER}" ]; then
			echo -n "/usr/include/db${VER}"
			return 0
		else
			eerror "sys-libs/db package requested, but headers not found" >&2
			return 1
		fi
	else
		#arguments given
		for x in $@
		do
			if VER=$(db_findver "=sys-libs/db-${x}*") &&
			   [ -d "/usr/include/db$(db_ver_to_slot $VER)" ]; then
				echo -n "/usr/include/db$(db_ver_to_slot $VER)"
				return 0
			fi
		done
		eerror "No suitable db version found"
		return 1
	fi
}


# Get the library name for berkeley db. Something like "db-4.2" will be the
# outcome. This function has two modes. Without any arguments it will give
# the best version available. With arguments that form the versions of db
# packages to test for, it will aim to find the library corresponding to it.

db_libname() {
	if [ $# -eq 0 ]; then
		VER="$(db_findver sys-libs/db)" || return 1
		if [ -e "/usr/$(get_libdir)/libdb-${VER}.so" ]; then
			echo -n "db-${VER}"
			return 0
		else
			eerror "sys-libs/db package requested, but library not found" >&2
			return 1
		fi
	else
		#arguments given
		for x in $@
		do
			if VER=$(db_findver "=sys-libs/db-${x}*"); then
				if [ -e "/usr/$(get_libdir)/libdb-${VER}.so" ]; then
					echo -n "db-${VER}"
					return 0
				fi
			fi
		done
		eerror "No suitable db version found" >&2
		return 1
	fi
}
