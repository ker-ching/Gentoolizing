# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils

MY_PN="PyCharm"

DESCRIPTION="Powerfull Python and Django IDE similar to IntelliJ IDEA"
HOMEPAGE="http://jetbrains.com/pycharm/"
SRC_URI="http://download.jetbrains.com/python/${MY_PN}-${PV}.tar.gz"

LICENSE="|| ( PyCharm-commercial
			  PyCharm-academic
			  PyCharm-classroom
			  PyCharm-opensource )"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

RESTRICT="strip"

RDEPEND=">=virtual/jdk-1.6"


src_install() {
	local dir="/opt/${P}"
	insinto "${dir}"
	doins -r *
	fperms 755 "${dir}/bin/${PN}.sh"
	local icon=${PN}
	newicon "bin/${MY_PN}_32.png" ${icon}.png
	dodir /usr/bin
	make_wrapper "${PN}" "/opt/${P}/bin/${PN}.sh"
	make_desktop_entry ${PN} "PyCharm ${PV}" ${icon} "Development;IDE"
}
