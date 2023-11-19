# This Puppet script sets up the SSH client configuration file.
# It configures the client to use the private key ~/.ssh/school
# and refuses to authenticate using a password.

# Seting up my client config file
# Include the stdlib module, which provides additional Puppet functions
include stdlib

# Ensure that the line 'PasswordAuthentication no' exists in the /etc/ssh/ssh_config file
file_line { 'Turn off passwd auth':
  ensure  => present,          # Ensure the line is present in the file
  path    => '/etc/ssh/ssh_config',  # Specify the path to the configuration file
  line    => '    PasswordAuthentication no',  # The line to be added or modified
  replace => true,             # Replace the line if it already exists
}

# Ensure that the line 'IdentityFile ~/.ssh/school' exists in the /etc/ssh/ssh_config file
file_line { 'Declare identity file':
  ensure  => present,          # Ensure the line is present in the file
  path    => '/etc/ssh/ssh_config',  # Specify the path to the configuration file
  line    => '     IdentityFile ~/.ssh/school',  # The line to be added or modified
  replace => true,             # Replace the line if it already exists
}
