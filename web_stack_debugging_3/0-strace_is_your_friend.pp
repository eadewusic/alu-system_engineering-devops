# 0-strace_is_your_friend.pp
# Puppet manifest to fix PHP fatal error in Apache

# Define an exec resource to replace the deprecated mysql_connect function
exec { 'fix_php_error':
  command     => '/bin/sed -i "s/mysql_connect/mysqli_connect/" /var/www/html/index.php',
  refreshonly => true,
  subscribe   => Service['apache2'],
}

# Restart Apache after fixing the PHP error
service { 'apache2':
  ensure  => running,
  require => Exec['fix_php_error'],
}
