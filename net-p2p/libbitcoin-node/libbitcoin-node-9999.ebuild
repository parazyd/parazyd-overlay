# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit autotools git-r3

DESCRIPTION="Bitcoin full node based on libbitcoin-blockchain"
HOMEPAGE="https://libbitcoin.info"
EGIT_REPO_URI="https://github.com/libbitcoin/${PN}"

LICENSE="AGPL-3+"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="static-libs debug test"

DEPEND="
	>=dev-libs/boost-1.72.0:=[threads(+)]
	>=net-p2p/libbitcoin-blockchain-${PV}
	>=net-p2p/libbitcoin-network-${PV}
"
RDEPEND="${DEPEND}"

src_prepare() {
	eautoreconf
	default
}

src_configure() {
	econf \
		--with-console \
		$(use_with test tests) \
		$(use_enable static-libs static) \
		$(use_enable debug ndebug)
}
