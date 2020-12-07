# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2
 
EAPI=7
 
DESCRIPTION="Gentoo system upgrade script"
HOMEPAGE="https://github.com/lyra64/gentoo-upgrade"
SRC_URI="https://github.com/lyra64/gentoo-upgrade/archive/1.0.tar.gz"
 
LICENSE=""
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""
 
DEPEND="
    app-portage/eix
    app-portage/gentoolkit
"

src_install () {
    exeinto /usr/bin
    doexe gentoo-update
}
