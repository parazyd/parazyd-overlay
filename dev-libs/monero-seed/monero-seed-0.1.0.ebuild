# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake

DESCRIPTION="14-word mnemonic seed for Monero"
HOMEPAGE="https://git.wownero.com/feather/monero-seed"
SRC_URI="https://git.wownero.com/feather/monero-seed/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

S="${WORKDIR}/${PN}"
