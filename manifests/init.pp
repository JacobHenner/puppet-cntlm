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
# @param cntlm_username The username to use for proxy authentication.
# @param cntlm_domain The domain to use for proxy authentication.
# @param cntlm_proxy A list of parent proxies to use in format ['proxy_ip:proxy_port', ...]
# @param package_manage Whether to manage the cntlm package.
# @param package_name Specifies the cntlm package to manage.
# @param package_ensure Whether to install the cntlm package, or a specific version to install. Values: 'present', 'latest', or a specific version.
# @param service_manage Whether to manage the cntlm service.
# @param service_ensure Whether the cntlm service should be running.
# @param service_enable Whether to enable the cntlm service at boot.
# @param service_name The cntlm service to manage. Default value: cntlm
# @param service_provider Which service provider to use for cntlm.
# @param cntlm_password The cleartext password used for proxy authentication. Other password methods are preferred.
# @param cntlm_passlm The PassLM password hash used for proxy authentication.
# @param cntlm_passnt The PassNT password hash used for proxy authentication.
# @param cntlm_passntlmv2 The PassNTLMv2 password hash used for proxy authentication.
# @param cntlm_workstation The netbios hostname cntlm will send to the parent proxies. If unset, the value is auto-guessed by cntlm.
# @param cntlm_noproxy An array of addresses that will not be passed through parent proxies. * and ? wildcards can be used.
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
    String[1] $cntlm_username,
    String[1] $cntlm_domain,
    Array[String[1]] $cntlm_proxy,
    Boolean $package_manage = true,
    String[1] $package_name = 'cntlm',
    String[1] $package_ensure = 'present',
    Boolean $service_manage = true,
    Enum['running', 'stopped'] $service_ensure = 'running',
    Boolean $service_enable = true,
    String[1] $service_name = 'cntlm',
    Optional[String[1]] $service_provider = undef,
    Optional[String[1]] $cntlm_password = undef,
    Optional[String[1]] $cntlm_passlm = undef,
    Optional[String[1]] $cntlm_passnt = undef,
    Optional[String[1]] $cntlm_passntlmv2 = undef,
    Optional[String[1]] $cntlm_workstation = undef,
    Optional[Array[String[1]]] $cntlm_noproxy = ['localhost', '127.0.0.*', '10.*', '192.168.*'],
    Optional[Array[String[1]]] $cntlm_listen = ['3128'],
    Optional[Array[String[1]]] $cntlm_socks5proxy = undef,
    Optional[Array[String[1]]] $cntlm_socks5user = undef,
    Optional[String[1]] $cntlm_auth = undef,
    Optional[String[1]] $cntlm_flags = undef,
    Boolean $cntlm_gateway = false,
    Optional[Array[String[1]]] $cntlm_allow = undef,
    Optional[Array[String[1]]] $cntlm_deny = undef,
    Optional[Integer] $cntlm_isascannersize = undef,
    Optional[Array[String[1]]] $cntlm_isascanneragent = undef,
    Optional[Array[String[1]]] $cntlm_header = undef,
    Optional[Array[String[1]]] $cntlm_tunnel = undef,
) {
    contain cntlm::install
    contain cntlm::config
    contain cntlm::service

    Class['::cntlm::install']
    -> Class['::cntlm::config']
    ~> Class['::cntlm::service']
}
