# cntlm
#
# Installs, configures, and runs the cntlm service, for NTLM authenticated proxying.
#
# @summary Installs, configures, and runs the cntlm service, for NTLM authenticated proxying.
#
# @example
#   class { 'cntlm':
#       cntlm_username => 'test_user',
#       cntlm_domain   => 'test_domain',
#       cntlm_password => 'test_password',
#       cntlm_proxy    => ['localhost:8080'],
#   }
#
# @param package_manage Whether to manage the cntlm package. Default value: true
# @param package_name Specifies the cntlm package to manage. Default value: 'cntlm'
# @param package_ensure Whether to install the cntlm package, or a specific version to install. Values: 'present', 'latest', or a specific version.
# @param service_manage Whether to manage the cntlm service. Default value: true.
# @param service_ensure Whether the cntlm service should be running. Default value: 'running'
# @param service_enable Whether to enable the cntlm service at boot. Default value" true.
# @param service_name The cntlm service to manage. Default value: cntlm
# @param service_provider Which service provider to use for cntlm. Default value: Undef.
# @param cntlm_username The username to use for proxy authentication.
# @param cntlm_domain The domain to use for proxy authentication.
# @param cntlm_password The cleartext password used for proxy authentication. Other password methods are preferred.
# @param cntlm_passlm The PassLM password hash used for proxy authentication.
# @param cntlm_passnt The PassNT password hash used for proxy authentication.
# @param cntlm_passntlmv2 The PassNTLMv2 password hash used for proxy authentication.
# @param cntlm_workstation The netbios hostname cntlm will send to the parent proxies. If unset, the value is auto-guessed by cntlm.
# @param cntlm_proxy A list of parent proxies to use in format ['proxy_ip:proxy_port', ...]
# @param cntlm_noproxy A comma separated list of addresses that will not be passed through parent proxyies. * and ? wildcards can be used.
# @param cntlm_listen The port(s) cntlm should listen on. Can also specify multiple specific interface(s) and port(s) to bind to, using 'ip:port'.
# @param cntlm_socks5proxy A list of interfaces and ports to bind to for SOCKS5 proxy functionality,  in format ['ip:port', ...]
# @param cntlm_socks5user A list of username:password pairs for permissioning access to the SOCKS5 proxy. If unset, the SOCKS5 proxy will accept all requests.
# @param cntlm_auth The authentication mode to use.
# @param cntlm_flags The authentication flags to use.
# @param cntlm_gateway Whether to allow access from other computers.
# @param cntlm_allow A list of IPs/CIDR-denoted subnets to allow to connect when gateway mode is enabled.
# @param cntlm_deny A list of IPs/CIDR-denoted subnets to restrict from connecting when gateway mode is enabled.
# @param cntlm_isascannersize The ISAScannerSize used with GFI WebMonitor.
# @param cntlm_isascanneragent A list of ISAScannerAgents used with GFI WebMonitor.
# @param cntlm_header A list of headers to replace if present in the request.
# @param cntlm_tunnel A list of tunnels mapping local ports to machines behind the proxy.
class cntlm (
    Boolean $package_manage,
    String[1] $package_name,
    String[1] $package_ensure,
    Boolean $service_manage,
    Enum['running', 'stopped'] $service_ensure,
    Boolean $service_enable,
    String[1] $service_name,
    Optional[String[1]] $service_provider,
    String[1] $cntlm_username,
    String[1] $cntlm_domain,
    Optional[String[1]] $cntlm_password,
    Optional[String[1]] $cntlm_passlm,
    Optional[String[1]] $cntlm_passnt,
    Optional[String[1]] $cntlm_passntlmv2,
    Optional[String[1]] $cntlm_workstation,
    Array[String[1]] $cntlm_proxy,
    Optional[String[1]] $cntlm_noproxy,
    Optional[Array[String[1]]] $cntlm_listen,
    Optional[Array[String[1]]] $cntlm_socks5proxy,
    Optional[Array[String[1]]] $cntlm_socks5user,
    Optional[String[1]] $cntlm_auth,
    Optional[String[1]] $cntlm_flags,
    Boolean $cntlm_gateway,
    Optional[Array[String[1]]] $cntlm_allow,
    Optional[Array[String[1]]] $cntlm_deny,
    Optional[Integer] $cntlm_isascannersize,
    Optional[Array[String[1]]] $cntlm_isascanneragent,
    Optional[Array[String[1]]] $cntlm_header,
    Optional[Array[String[1]]] $cntlm_tunnel,
) {
    contain cntlm::install
    contain cntlm::config
    contain cntlm::service

    Class['::cntlm::install']
    -> Class['::cntlm::config']
    ~> Class['::cntlm::service']
}
