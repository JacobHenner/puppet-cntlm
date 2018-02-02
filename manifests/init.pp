# cntlm
#
# Installs, configures, and runs the cntlm service, for NTLM authenticated proxying.
#
# @summary Installs, configures, and runs the cntlm service, for NTLM authenticated proxying.
#
# @example
#   include cntlm
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
# @param cntlm_listen The port cntlm should listen on. Can also specify a specific interface and port to bind to, using 'ip:port'.
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
    String $package_name,
    String $package_ensure,
    Boolean $service_manage,
    Enum['running', 'stopped'] $service_ensure,
    Boolean $service_enable,
    String $service_name,
    Optional[String] $service_provider,
    String $cntlm_username,
    String $cntlm_domain,
    Optional[String] $cntlm_password,
    Optional[String] $cntlm_passlm,
    Optional[String] $cntlm_passnt,
    Optional[String] $cntlm_passntlmv2,
    Optional[String] $cntlm_workstation,
    Array[String] $cntlm_proxy,
    Optional[String] $cntlm_noproxy,
    Optional[String] $cntlm_listen,
    Optional[Array] $cntlm_socks5proxy,
    Optional[Array] $cntlm_socks5user,
    Optional[String] $cntlm_auth,
    Optional[String] $cntlm_flags,
    Boolean $cntlm_gateway,
    Optional[Array] $cntlm_allow,
    Optional[Array] $cntlm_deny,
    Optional[Integer] $cntlm_isascannersize,
    Optional[Array] $cntlm_isascanneragent,
    Optional[Array] $cntlm_header,
    Optional[Array] $cntlm_tunnel,
) {
    contain cntlm::install
    contain cntlm::config
    contain cntlm::service

    Class['::cntlm::install']
    -> Class['::cntlm::config']
    ~> Class['::cntlm::service']
}