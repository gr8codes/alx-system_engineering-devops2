# Install nginx

exec {'Update system':
  command => '/usr/bin/apt-get update',
}

# Install nginx
package {'nginx':
  ensure  => installed,
  require => Exec['Update system'],
}

# Write 'Hello World' to the main nginx page
file {'/var/www/html/index.html':
  content => 'Hello World!',
}

# Redirect /redirect_me to a youtube video
file {'Redirect me':
  ensure => 'present',
  path   => '/etc/nginx/sites-available/default',
  after  => 'listen 80 default_server;',
  line   => 'rewrite ^/redirect_me https://www.youtube.com/watch?v=QH2-TGUlwu4 permanent;',
}

service {'nginx':
  ensure  => running,
  require => Package['nginx'],
}
