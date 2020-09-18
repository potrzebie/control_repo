class profile::ssh_server {
  package {'openssh-server':
    ensure => present,
  }
  service { 'sshd':
    ensure => 'running',
    enable => 'true',
  }
  ssh_authorized_key { 'root@master.puppet.vm':
    ensure => present,
    user   => 'root',
    type   => 'ssh-rsa',
    key    => 'AAAAB3NzaC1yc2EAAAADAQABAAABAQC8vxdEe6XYjTSxaidTcKgqHcN0lSZvrSjenmcEpvne7ZktDQA780ICwOgBfQpOcYvTGPgMqK3+v6/jfJ9uPTUoVMx6V6fSpoABfTJnOS5WvzxX/AGdeykASmyuRu6OI2jVoQFEcjm75KTeCGQLTWsV9xpbuDWqChnu7Ei/zE0TlnSqOX+jpauJ8iCmfBJXKnQNXY2K1WXfOKNvCwg3aXJi7n/rgoI3z1RNkYJhLAgyK1pvawSPgBTHqNfvxN4j7brbsfqVLqgPvlk57EHI+PPx39iMjzHWJv6vgnlMWMCFalGKjIXFw4M0W9BJDzfYqIX7PWwd5LQwUmcAch9EqUv1',
  }
}
