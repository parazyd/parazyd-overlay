# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit font git-r3

DESCRIPTION="Google Fonts' Sorts Mill Goudy (sortsmillgoudy) font."
HOMEPAGE="https://fonts.google.com/specimen/Sorts+Mill+Goudy"
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
	FONT_S="$WORKDIR/${P}/ofl/sortsmillgoudy" font_src_install
}
