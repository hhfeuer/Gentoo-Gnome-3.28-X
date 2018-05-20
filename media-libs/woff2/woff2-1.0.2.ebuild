# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit cmake-utils vcs-snapshot
MY_PV="36e6555"
[[ -n ${PV%%*_p*} ]] && MY_PV="v${PV}"
SRC_URI="https://github.com/google/${PN}/archive/${MY_PV}.tar.gz -> ${P}.tar.gz"
RESTRICT="primaryuri"
KEYWORDS="amd64 ~x86"

DESCRIPTION="A library and utils for Web Open Font Format 2.0"
HOMEPAGE="https://github.com/google/${PN}"

LICENSE="Apache-2.0"
SLOT="0"
IUSE=""

RDEPEND="
	app-arch/brotli
"
DEPEND="
	${RDEPEND}
	virtual/pkgconfig
"

DOCS="CONTRIBUTING.md README.md"

src_prepare() {
	sed -e '/^set(CMAKE_SKIP_BUILD_RPATH/,/^endif()/d' -i CMakeLists.txt
	cmake-utils_src_prepare
}

