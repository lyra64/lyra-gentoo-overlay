# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2
 
EAPI=7
 
DESCRIPTION="Gentoo system upgrade script"
HOMEPAGE="https://github.com/alicela1n/gentoo-update"

LICENSE="GPL-2"
SLOT="0"
if [[ ${PV} == 9999* ]] ; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/alicela1n/gentoo-update.git"
else
	KEYWORDS="~amd64 ~x86"
	SRC_URI="https://github.com/alicela1n/gentoo-update/archive/${PV}.tar.gz"
fi

IUSE=""

RESTRICT="mirror"

S=${WORKDIR}/gentoo-update-${PV}

DEPEND="
    app-portage/eix
    app-portage/gentoolkit
"

src_install () {
	insinto /etc
	doins "${S}"/gentoo-update.conf

    exeinto /usr/bin
    doexe gentoo-update
}
