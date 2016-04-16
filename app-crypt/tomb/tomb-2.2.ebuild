# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6
inherit eutils

DESCRIPTION="The Crypto Undertaker"
HOMEPAGE="https://www.dyne.org/software/tomb"
SRC_URI="https://files.dyne.org/tomb/tomb-2.2.tar.gz"

LICENSE="GPL-3+"
SLOT="0"
KEYWORDS="~alpha ~amd64 ~arm ~hppa ~ia64 ~ppc ~ppc64 ~s390 ~sh ~sparc ~x86"
IUSE="kdf gtk"

DEPEND="
	dev-libs/libgcrypt
	sys-fs/cryptsetup
	app-admin/sudo
	app-crypt/pinentry
	app-crypt/gnupg
	gtk? ( gnome-extra/zenity )
"

RDEPEND="${DEPEND}"

DOCS=( doc/TODO.org )

src_compile() {
	if use kdf; then
		emake CC=$(tc-getCC) -C extras/kdf-keys/
	fi
}

src_install() {
	dobin tomb
	doman doc/tomb.1
	if use kdf; then
		dobin extras/kdf-keys/tomb-kdb-hexencode
		dobin extras/kdf-keys/tomb-kdb-pbkdf2
		dobin extras/kdf-keys/tomb-kdb-pbkdf2-gensalt
		dobin extras/kdf-keys/tomb-kdb-pbkdf2-getiter
	fi
	if use gtk; then
		dobin extras/gtomb/gtomb
	fi
}
