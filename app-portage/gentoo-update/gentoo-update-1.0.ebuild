# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2
 
EAPI=7
 
DESCRIPTION="Gentoo system upgrade script"
HOMEPAGE="https://github.com/alicela1n/gentoo-update"
SRC_URI="https://github.com/alicela1n/gentoo-update/archive/1.0.tar.gz"
 
LICENSE=""
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""
S=${WORKDIR}/gentoo-update-1.0

DEPEND="
    app-portage/eix
    app-portage/gentoolkit
"

src_install () {
    exeinto /usr/bin
    doexe gentoo-update
}
