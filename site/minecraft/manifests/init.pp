class minecraft (
  $url = 'https://launcher.mojang.com/v1/objects/c8f83c5655308435b3dcf03c06d9fe8740a77469/server.jar',
  $jdk_rpm = 'https://download.oracle.com/java/17/archive/jdk-17.0.3.1_linux-x64_bin.rpm',
  $install_dir = '/opt/manifest/'
){
  file {'/opt/minecraft':
    ensure => directory,
  }
  file {'${install_dir}/minecraft_server.jar':
    ensure => file,
    source => $url,
    before => Service['minecraft'],
  }
  file {'/root/jdk_17.rpm':
    ensure => file,
    source => $jdk_rpm,
    before => Package['jdk_17.rpm'],
  }
  package {'jdk_17.rpm':
    ensure => present,
    provider => 'rpm',
    source => '/root/jdk_17.rpm',
  }
  #package {'java':
  #  ensure => present,
  #}
  
  file {'${install_dir}/eula.txt':
    ensure => file,
    content => 'eula=true',
  }
  file {'/etc/systemd/system/minecraft.service':
    ensure => file,
    content => epp('minecraft/minecraft.service', {
      install_dir => $install_dir
    })
  }
  service {'minecraft':
    ensure => 'running',
    enable => true,
    require => [Package['jdk_17.rpm'], File['/opt/minecraft/eula.txt'], File['/etc/systemd/system/minecraft.service']],
  }
}
