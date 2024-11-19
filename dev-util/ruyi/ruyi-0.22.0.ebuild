# SPDX-License-Identifier: Apache-2.0

EAPI=8

DISTUTILS_USE_PEP517=poetry
PYTHON_COMPAT=( python3_{11..13} )  # no python3.10 to avoid tomli

inherit distutils-r1

MY_PV="${PV/_beta/-beta.}"

DESCRIPTION="RuyiSDK Package Manager"
HOMEPAGE="https://github.com/ruyisdk/ruyi"
SRC_URI="
	https://github.com/ruyisdk/ruyi/archive/${MY_PV}.tar.gz
		-> ${P}.gh.tar.gz
"
S="${WORKDIR}/${PN}-${MY_PV}"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~riscv"

RDEPEND="
	dev-python/arpy[${PYTHON_USEDEP}]
	dev-python/jinja2[${PYTHON_USEDEP}]
	dev-python/packaging[${PYTHON_USEDEP}]
	dev-python/pygit2[${PYTHON_USEDEP}]
	dev-python/pyyaml[${PYTHON_USEDEP}]
	dev-python/requests[${PYTHON_USEDEP}]
	dev-python/rich[${PYTHON_USEDEP}]
	dev-python/semver[${PYTHON_USEDEP}]
	dev-python/tomlkit[${PYTHON_USEDEP}]
"

distutils_enable_tests pytest

python_install_all() {
	distutils-r1_python_install_all

	insinto "/usr/share/${PN}"
	doins "${FILESDIR}/config.toml"
}
