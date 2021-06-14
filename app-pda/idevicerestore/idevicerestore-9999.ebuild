# Copyright 1999-2021 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7
inherit autotools flag-o-matic

DESCRIPTION="A cross-platform tool to restore Apple devices from IPSW files."
HOMEPAGE="http://libimobiledevice.org"
if [[ ${PV} == 9999* ]]; then
        inherit git-r3
        EGIT_REPO_URI="https://github.com/libimobiledevice/${PN}"
else
        RESTRICT="mirror"
        SRC_URI="https://github.com/libimobiledevice/${PN}/releases/download/${PV}/${P}.tar.bz2"
fi

S="${WORKDIR}/idevicerestore-${PV}"

LICENSE="GPL-3 LGPL-3.0"
KEYWORDS="~amd64 ~x86 ~arm ~arm64"
SLOT="0/6"
KEYWORDS=""

RESTRICT="mirror"

RDEPEND=">=app-pda/libirecovery-1.0.1
	>=app-pda/libimobiledevice-1.3.0
	app-pda/libplist
	>=dev-libs/libzip-0.8.0
	>=net-misc/curl-7.0.0
	dev-libs/openssl"
DEPEND="${RDEPEND}
	virtual/pkgconfig"

DOCS=( AUTHORS INSTALL NEWS README TODO )

src_prepare() {
	default
	eautoreconf
}

src_configure() {
	# the software's configure.ac doesn't handle things quite correctly,
	# pass -pthread and -lpthread to solve the issue
	append-flags "-pthread"
	append-ldflags "-lpthread"
	econf
}

src_install() {
	emake DESTDIR="${D}" install
	doman docs/idevicerestore.1
	find "${D}" -name '*.la' -delete || die
}
