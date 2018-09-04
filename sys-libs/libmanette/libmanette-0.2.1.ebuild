# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6
VALA_MIN_API_VERSION=${VALA_MIN_API_VERSION:-0.36}
VALA_MAX_API_VERSION=${VALA_MAX_API_VERSION:-0.38}
VALA_USE_DEPEND="vapigen"

inherit gnome2 meson vala

DESCRIPTION="A simple GObject game controller library."
HOMEPAGE="https://gitlab.gnome.org/aplazas/libmanette"

LICENSE="LGPL-2+"
SLOT="0"
IUSE="vala"

KEYWORDS="~amd64 ~x86"

COMMON_DEPEND="
	>=dev-libs/glib-2.38.0
	dev-libs/libgudev
	dev-libs/libevdev
"
DEPEND="${COMMON_DEPEND}
	${vala_depend}
"

src_prepare() {
        vala_src_prepare
	gnome2_src_prepare
        default
}

src_configure() {
        ## HACK - ['vapigen'] not found or not executable
        VAPIGEN=`whereis vapigen- | cut -d\  -f2` meson_src_configure
}