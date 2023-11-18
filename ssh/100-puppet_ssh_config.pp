file { '/home/ubuntu/.ssh/config':
  ensure  => present,
  content => "Host *\n  IdentityFile /home/ubuntu/.ssh/school\n  PasswordAuthentication no\n",
  owner   => 'ubuntu',
  group   => 'ubuntu',
}

exec { 'chmod_ssh_config':
  command => '/bin/chmod 600 /home/ubuntu/.ssh/config',
  path    => '/bin',
  onlyif  => '/bin/test -f /home/ubuntu/.ssh/config',
}
