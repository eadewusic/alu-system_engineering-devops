# This Puppet script sets up the SSH client configuration file.
# It configures the client to use the private key ~/.ssh/school
# and refuses to authenticate using a password.
file { '/home/ubuntu/.ssh/config':
  ensure  => present,
  content => "Host *\n  IdentityFile /home/ubuntu/.ssh/school\n  PasswordAuthentication no\n",
  owner   => 'ubuntu',
  group   => 'ubuntu',
}

exec { 'chmod_ssh_config':
  command => '/bin/chmod 600 /home/ubuntu/.ssh/config',
  path    => '/bin',
  onlyif  => 'file_exists("/home/ubuntu/.ssh/config")',
}
