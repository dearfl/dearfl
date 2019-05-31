# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
inherit meson

DESCRIPTION="A simple and modern eBook viewer"
HOMEPAGE="https://johnfactotum.github.io/foliate/"
SRC_URI="https://github.com/johnfactotum/foliate/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

CDEPEND="
	dev-libs/gjs
	net-libs/webkit-gtk
	net-libs/libsoup
"
DEPEND="
	${CDEPEND}
	dev-util/meson
"
RDEPEND="${CDEPEND}"
BDEPEND=""

