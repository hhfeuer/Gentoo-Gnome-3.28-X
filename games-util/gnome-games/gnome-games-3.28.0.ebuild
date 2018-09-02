# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6
VALA_MIN_API_VERSION=${VALA_MIN_API_VERSION:-0.36}
VALA_MAX_API_VERSION=${VALA_MAX_API_VERSION:-0.38}
VALA_USE_DEPEND="vapigen"

inherit gnome2 vala

DESCRIPTION="Simple game launcher for GNOME"
HOMEPAGE="https://wiki.gnome.org/Apps/Games"

LICENSE="GPL-3"
SLOT="0"
IUSE="vala"

KEYWORDS="~amd64 ~x86"

COMMON_DEPEND="
	gnome-base/gnome-desktop:3=
	>=sys-libs/libmanette-0.2.0
	>=sys-libs/retro-gtk-0.13.2
"

DEPEND="${COMMON_DEPEND}
	${vala_depend}
"

src_prepare() {
	vala_src_prepare
        gnome2_src_prepare
	default
}
