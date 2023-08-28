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
file {'/usr/share/nginx/www/index.html':
  content => 'Hello World!',
}

# Redirect /redirect_me to a youtube video
file {'Redirect me':
  command  => 'sed -i "24i\	rewrite ^/redirect_me https://www.youtube.com/watch?v=QH2-TGUlwu4 permanent;" /etc/nginx/sites-available/default',
  provider => 'shell',
}

service {'nginx':
  ensure  => running,
  require => Package['nginx'],
}