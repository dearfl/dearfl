# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

MY_PV="v${PV}"

DESCRIPTION="You can use goxel to create voxel graphics."
HOMEPAGE="https://guillaumechereau.github.io/goxel/"
SRC_URI="https://github.com/guillaumechereau/goxel/archive/${MY_PV}.zip"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

CDEPEND="
	media-libs/glfw
	x11-libs/gtk+
"
DEPEND="
	${CDEPEND}
	dev-util/scons
"
RDEPEND="${CDEPEND}"
BDEPEND=""

src_prepare() {
	sed -i -e 's/\${SNAP}\/icon.png/goxel/' snap/gui/goxel.desktop || die "prepare failed"
	default
}

src_compile() {
	pushd "${S}"
	emake release || die "make failed"
	popd
}

src_install() {
	emake DESTDIR="${D}" PREFIX="/usr" install || die "install failed"
	# chmod +x "${ED}/bin/goxel"
}

pkg_postinst() {
	chmod +x /usr/bin/goxel
}
