# cntlm::service
#
# Manages the cntlm service
#
# @summary Manages the cntlm service
#
class cntlm::service {
    if ! ($cntlm::service_ensure in [ 'running', 'stopped' ]) {
        fail('service_ensure parameter must be running or stopped')
    }

    if $cntlm::service_manage == true {
    service { 'cntlm':
      ensure     => $cntlm::service_ensure,
      enable     => $cntlm::service_enable,
      name       => $cntlm::service_name,
      provider   => $cntlm::service_provider,
      hasstatus  => true,
      hasrestart => true,
    }
  }
}
