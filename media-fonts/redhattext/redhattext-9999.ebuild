# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit font git-r3

DESCRIPTION="Google Fonts Red Hat Text font"
HOMEPAGE="https://fonts.google.com/specimen/Red+Hat+Text"
EGIT_REPO_URI="https://github.com/google/fonts"

LICENSE="OFL-1.1"
SLOT="0"
KEYWORDS=""
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

RESTRICT="binchecks strip"
FONT_SUFFIX="ttf"

src_install() {
	FONT_S="$WORKDIR/${P}/ofl/redhattext" font_src_install
}
