# Install flask from pip3

class { 'python::pip':
  ensure   => present,  # ensure pip is installed
}

python::pip::package { 'flask':
  ensure   => '2.1.1',
  provider => 'pip3',
}
