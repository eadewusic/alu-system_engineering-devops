# 0-strace_is_your_friend.pp
# Puppet manifest to fix PHP fatal error in Apache

exec { 'fix_php_error':
  command => 'sed -i s/phpp/php/g /var/www/html/index.php',
  path    => '/usr/local/bin/:/bin/',
  notify  => Service['apache2'],
}

service { 'apache2':
  ensure => running,
}
