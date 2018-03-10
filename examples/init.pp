class { 'cntlm':
  cntlm_username => 'test_user',
  cntlm_domain   => 'test_domain',
  cntlm_password => 'test_password',
  cntlm_proxy    => ['localhost:8080'],
}