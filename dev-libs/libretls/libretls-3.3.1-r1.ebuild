# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit multilib-minimal

DESCRIPTION="Port of libtls from LibreSSL to OpenSSL"
HOMEPAGE="https://git.causal.agency/libretls/about/"
SRC_URI="https://causal.agency/libretls/${P}.tar.gz"

LICENSE="ISC"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="static-libs"

DEPEND="dev-libs/openssl:="
RDEPEND="${DEPEND}
	!dev-libs/libressl"
BDEPEND="virtual/pkgconfig"

multilib_src_configure() {
	local myconf=(
		$(use_enable static-libs static)
	)
	ECONF_SOURCE="${S}" econf "${myconf[@]}"
}

multilib_src_install() {
	default
	find "${D}" -name '*.la' -delete || die
}