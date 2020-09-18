class minecraft (
  $url = 'https://launcher.mojang.com/v1/objects/f02f4473dbf152c23d7d484952121db0b36698cb/server.jar',
  $install_dir = '/opt/minecraft'
  ){
  file {$install_dir:
    ensure => directory,
  }
  file {"${install_dir}/minecraft_server.jar":
    ensure => file,
    source => 'https://launcher.mojang.com/v1/objects/f02f4473dbf152c23d7d484952121db0b36698cb/server.jar',
    before => Service['minecraft'],
  }
  package {'java':
    ensure => present,
  }
  file {"${install_dir}/eula.txt":
    ensure => file,
    content => 'eula=true',
  }
  file {'/etc/systemd/system/minecraft.service':
    ensure => file,
    content => epp('minecraft/minecraft.service',{
      install_dir => $install_dir
    })
  }
  service { 'minecraft':
    ensure => running,
    enable => true,
    require => [Package['java'],File["${install_dir}/eula.txt"],File['/etc/systemd/system/minecraft.service']],
  }
}
