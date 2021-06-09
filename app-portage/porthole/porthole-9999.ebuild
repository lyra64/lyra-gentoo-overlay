# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="A fork of porthole rewritten for python 3"
HOMEPAGE="https://gitlab.com/mikeos2/porthole"

LICENSE="GPL-2"
SLOT="0"

PYTHON_COMPAT=( python3_{7..9} )
inherit distutils-r1

if [[ ${PV} == 9999* ]] ; then
	inherit git-r3
	EGIT_REPO_URI="https://gitlab.com/mikeos2/porthole.git"
else
	KEYWORDS="~amd64 ~arm ~arm64 ~hppa ~ppc ~sparc ~x86"
fi

RESTRICT="mirror"

S=${WORKDIR}/porthole-${PV}

RDEPEND="
	>=dev-lang/python-3.0[xml,threads]
	>=sys-apps/portage-2.1
	>=gnome-base/libglade-2.5.0
"
DEPEND="${RDEPEND}
"

src_install() {
	distutils-r1_src_install

	dodoc TODO README NEWS AUTHORS

	keepdir /var/log/porthole
	fperms g+w /var/log/porthole
	keepdir /var/db/porthole
	fperms g+w /var/db/porthole

	rm -rf "${D}/usr/share/${PN}"/{pocompile,dopot}.sh
}

pkg_preinst() {
	chgrp portage "${D}"/var/log/porthole
	chgrp portage "${D}"/var/db/porthole
}

pkg_postinst() {
	einfo
	einfo "Porthole has updated the way that the upgrades are sent to emerge."
	einfo "In this new way the user needs to set any 'Settings' menu emerge options"
	einfo "Porthole automatically adds '--oneshot' for all upgrades selections"
	einfo "Other options recommended are '--noreplace'  along with '--update'"
	einfo "They allow for portage to skip any packages that might have already"
	einfo "been upgraded as a dependency of another previously upgraded package"
	einfo
}
