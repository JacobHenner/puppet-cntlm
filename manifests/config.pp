# cntlm::config
#
# Configures cntlm using cntlm.conf.epp template
#
# @summary Configures cntlm using cntlm.conf.epp template
#
class cntlm::config {
    file { '/etc/cntlm.conf':
        ensure  => file,
        owner   => 0,
        group   => 0,
        mode    => '0600',
        content => epp('cntlm/cntlm.conf.epp')
    }
}
