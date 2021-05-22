# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

CMAKE_MAKEFILE_GENERATOR="emake"
CMAKE_REMOVE_MODULES_LIST=( none )
inherit cmake

DESCRIPTION="Yet another magic lamp for kde"
HOMEPAGE="https://github.com/zzag/kwin-effects-yet-another-magic-lamp"
if [[ ${PV} == 9999* ]] ; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/zzag/kwin-effects-yet-another-magic-lamp.git"
else
	KEYWORDS="amd64 x86"
	SRC_URI="https://github.com/zzag/kwin-effects-yet-another-magic-lamp/archive/${PV}.tar.gz"
fi

RESTRICT="mirror"

LICENSE="GPL-2"
SLOT="0"
IUSE=""

DEPEND="
	dev-util/cmake
	kde-frameworks/extra-cmake-modules
	kde-plasma/kwin
	"
RDEPEND="${DEPEND}"
BDEPEND=""

src_configure() {
	local mycmakeargs=(
		-DCMAKE_BUILD_TYPE=Release
	)

	cmake_src_configure
}

src_install() {
	cmake_src_install
}
