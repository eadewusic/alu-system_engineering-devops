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

# Add regexes to validate the configuration
validate_augeas { 'ssh_config':
  lens    => 'Sshd.lns',
  incl    => '/etc/ssh/ssh_config',
  context => '/files/etc/ssh/ssh_config',
  changes => [
    'set Host[.="*"]/IdentityFile[.="~/.ssh/school"]',
    'set Host[.="*"]/PasswordAuthentication[.="no"]',
  ],
}
