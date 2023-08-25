# Install flask from pip3
package { 'flask':
  ensure   => 'latest',
  provider => 'pip3',
}
