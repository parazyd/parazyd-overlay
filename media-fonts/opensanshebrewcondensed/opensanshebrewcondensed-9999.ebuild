# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit font git-r3

DESCRIPTION="Google Fonts opensanshebrewcondensed font"
HOMEPAGE="https://fonts.google.com/specimen/opensanshebrewcondensed"
EGIT_REPO_URI="https://github.com/google/fonts"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS=""
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

RESTRICT="binchecks strip"
FONT_SUFFIX="ttf"

src_install() {
	FONT_S="$WORKDIR/${P}/apache/opensanshebrewcondensed" font_src_install
}
