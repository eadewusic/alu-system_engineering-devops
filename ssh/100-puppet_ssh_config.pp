# This Puppet script sets up the SSH client configuration file.
# It configures the client to use the private key ~/.ssh/school
# and refuses to authenticate using a password.

file { '/etc/ssh/ssh_config':
  ensure  => present,
  content => "Host *\n  IdentityFile ~/.ssh/school\n  PasswordAuthentication no",
  owner   => 'root',
  group   => 'root',
  mode    => '0644',
}
