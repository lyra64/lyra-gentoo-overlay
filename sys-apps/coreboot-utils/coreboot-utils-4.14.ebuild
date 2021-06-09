# Copyright (c) 2017 sakaki <sakaki@deciban.com>
#			(c) 2021 quarkyalice <devfusediboot@protonmail.com>
# License: GPL v3+
# NO WARRANTY

EAPI=6
inherit toolchain-funcs

KEYWORDS="~amd64 ~arm ~arm64"

DESCRIPTION="Selected utilities from the coreboot project"
HOMEPAGE="https://www.coreboot.org"
SRC_URI="https://coreboot.org/releases/coreboot-${PV}.tar.xz -> ${P}.tar.xz"
LICENSE="GPL-2"
SLOT="0"
IUSE=""
RESTRICT="mirror"

S="${WORKDIR}/coreboot-${PV}"

DEPEND="amd64? ( >=sys-apps/pciutils-3.4.1 )
	"
RDEPEND="${DEPEND}"

PATCHES=( "${FILESDIR}/${P}-fix-install-path.patch" )

src_compile() {
	cd "${S}/util/cbfstool"
	emake clean
	emake
	cd "${S}/util/ifdtool"
	emake clean
	emake
	if use amd64; then
		# intelmetool has a slightly nicer Makefile
		cd "${S}/util/intelmetool"
		emake clean
		emake
	fi
}

src_install() {
	cd "${S}/util/cbfstool"
	emake DESTDIR="${D}" install
	cd "${S}/util/ifdtool"
	emake DESTDIR="${D}" install
	if use amd64; then
		cd "${S}/util/intelmetool"
		emake DESTDIR="${D}" install
	fi
}
