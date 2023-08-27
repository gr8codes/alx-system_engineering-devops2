#!/usr/bin/env bash
# Make changes to ssh configuration.
file_line { 'Turn off password authentication':
  ensure  => present,
  path    => '/etc/ssh/sshd_config',
  line    => '   PasswordAuthentication no',
  replace => true,
}

file_line { 'Declare identity file':
  ensure  => present,
  path    => '/etc/ssh/sshd_config',
  line    => '   IdentityFile ~/.ssh/school',
  replace => true,
}
