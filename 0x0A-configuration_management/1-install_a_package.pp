# Install flask from pip3

class { 'python::pip':
  ensure   => present,  # ensure pip is installed
}

python::pip::package { 'Flask':
  ensure   => '2.1.0',
  provider => 'pip3',

}
