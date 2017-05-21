# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/net-analyzer/openvas-libraries/openvas-libraries-6.0.0.ebuild,v 1.1 2013/07/01 10:19:17 hanno Exp $

EAPI=5

inherit cmake-utils git-2

DESCRIPTION="Runtime translation from GL 1.x to GL ES 1.x"
HOMEPAGE="https://github.com/ptitSeb/gl4es"
EGIT_REPO_URI="https://github.com/ptitSeb/gl4es"

SLOT="0"
LICENSE="MIT"
KEYWORDS=""
IUSE="+odroid"

RDEPEND="virtual/opengl
	>=media-libs/mesa-17.0.4[egl,gles1,gles2]
	x11-drivers/mali-drivers"
DEPEND="${RDEPEND}
	dev-util/cmake"

src_configure() {

	local mycmakeargs=( $(cmake-utils_use odroid) ) 

	cmake-utils_src_configure
}

src_compile() {
	cmake-utils_src_compile
}

src_install() {

	local opengl_dir="/usr/$(get_libdir)/mali"

	insinto "${opengl_dir}"
	doins "${BUILD_DIR}/lib/libGL.so.1"
	dosym libGL.so.1 "${opengl_dir}/libGL.so"

#        dodir /usr/lib/pkgconfig
#	insinto "/usr/$(get_libdir)/pkgconfig"
#        doins "${FILESDIR}/gl.pc"

	dodir /usr/include/GL
	insinto "/usr/include/GL"
        doins "${S}/include/GL/glu_mangle.h"
        doins "${S}/include/GL/glx.h"
        doins "${S}/include/GL/glu.h"
        doins "${S}/include/GL/glxext.h"
        doins "${S}/include/GL/glx_mangle.h"
}
