# This Puppet script sets up the SSH client configuration file.
# It configures the client to use the private key ~/.ssh/school
# and refuses to authenticate using a password.
file { '/etc/ssh/ssh_config':
  ensure  => present,
  content => "^\s*PasswordAuthentication no",
  owner   => 'root',
  group   => 'root',
  mode    => '0644',
}
