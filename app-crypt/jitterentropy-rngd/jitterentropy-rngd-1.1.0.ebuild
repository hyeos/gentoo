# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit linux-info systemd

DESCRIPTION="Jitter RNG daemon"
HOMEPAGE="http://www.chronox.de/jent.html"
SRC_URI="https://github.com/smuellerDD/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

PATCHES=(
	"${FILESDIR}"/${P}-do-not-strip-and-compress.patch
)

src_install() {
	emake DESTDIR="${D}" PREFIX="${EPREFIX}/usr" \
		UNITDIR="$(systemd_get_systemunitdir)" install
}