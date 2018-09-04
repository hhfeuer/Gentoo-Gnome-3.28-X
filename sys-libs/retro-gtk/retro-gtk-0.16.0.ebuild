# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6
VALA_MIN_API_VERSION=${VALA_MIN_API_VERSION:-0.36}
VALA_MAX_API_VERSION=${VALA_MAX_API_VERSION:-0.38}
VALA_USE_DEPEND="vapigen"

inherit gnome2 meson vala

DESCRIPTION="Toolkit to write GTK+ 3 based Libretro frontends"
HOMEPAGE="https://gitlab.gnome.org/GNOME/retro-gtk"

LICENSE="GPL-3"
SLOT="0"
IUSE="demos +introspection vala"

KEYWORDS="~amd64 ~x86"
USE="introspection"

COMMON_DEPEND="
	>=dev-libs/glib-2.44:2[dbus]
	>=x11-libs/gtk+-3.21.3:3[introspection?]
	introspection? ( >=dev-libs/gobject-introspection-0.9.3:= )
"

DEPEND="${COMMON_DEPEND}
	${vala_depend}
"

src_prepare() {
	default
        vala_src_prepare
}

src_configure() {
	local emesonargs=(
		-Dintrospection=$(usex introspection true false)
                -Ddemos=$(usex demos true false)
	)

	## HACK - ['vapigen'] not found or not executable
	VAPIGEN=`whereis vapigen- | cut -d\  -f2` meson_src_configure
}
