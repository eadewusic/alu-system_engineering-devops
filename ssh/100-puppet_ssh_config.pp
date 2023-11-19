# This Puppet script sets up the SSH client configuration file.
# It configures the client to use the private key ~/.ssh/school
# and refuses to authenticate using a password.

# Define a variable for the private key path
$private_key = '/home/ubuntu/.ssh/school'

# Define a regex to match lines that start with "Host"
$host_regex = /^Host /

# Use a template to generate the file content
file { '/etc/ssh/ssh_config':
  ensure  => present,
  content => template('ssh/ssh_config.erb'),
  owner   => 'root',
  group   => 'root',
  mode    => '0600',
  regexes => [
    $host_regex,
  ],
}

# Use the user resource to manage the public key
user { 'ubuntu':
  ensure         => present,
  ssh_authorized_key => {
    'school' => {
      ensure => present,
      type   => 'rsa',
      key    => 'AAAAB3NzaC1yc2EAAAADAQABAAABAQDQ3xw...',
    },
  },
}
