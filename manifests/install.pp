# cntlm::install
#
# Installs cntlm
#
# @summary Installs cntlm
#
class cntlm::install {
    if $cntlm::package_manage {
        package { $cntlm::package_name:
            ensure => $cntlm::package_ensure,
        }
    }
}
