# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

# AUTOTOOLS_IN_SOURCE_BUILD="1"
# inherit autotools-utils eutils

DESCRIPTION="Utilise Pixie Dust Attack to find the correct WPS PIN."
HOMEPAGE="https://github.com/t6x/reaver-wps-fork-t6x"
SRC_URI="https://github.com/t6x/reaver-wps-fork-t6x/archive/v${PV}.tar.gz"

ECONF_SOURCE="${S}/src"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
	!net-wireless/reaver
	net-libs/libpcap
	net-wireless/pixiewps
	net-wireless/aircrack-ng
	dev-db/sqlite:3
"
RDEPEND="${DEPEND}"

#S="${WORKDIR}/${P}/src"

ECONF_SOURCE="${S}/src"

#these patches need to be verified and pushed upstream
src_prepare() {
#	epatch "${FILESDIR}" /000[1-4]*.patch
	#http://code.google.com/p/reaver-wps/issues/detail?id=420
#	epatch "${FILESDIR}" /0005-soreau-show-status-r2.patch

	epatch "${FILESDIR}"/0100-Include-sys-types.h-for-definition-of-u_char.patch
}

src_install() {
	cd src
	dobin wash reaver

	insinto "/etc/reaver"
	doins reaver.db

	doman ../docs/reaver.1.gz
	dodoc ../docs/README ../docs/README.REAVER ../docs/README.WASH
}
