class minecraft {
  file {'/opt/minecraft':
    ensure => directory,
  }
  file {'/opt/minecraft/minecraft_server.jar':
    ensure => file,
    source => 'https://launcher.mojang.com/v1/objects/c8f83c5655308435b3dcf03c06d9fe8740a77469/server.jar',
  }
  file {'/root/jdk_17.rpm':
    ensure => file,
    source => 'https://download.oracle.com/java/17/archive/jdk-17.0.3.1_linux-x64_bin.rpm',
  }
  package {'jdk_17.rpm':
    ensure => present,
    provider => 'rpm',
    source => '/root/jdk_17.rpm',
  }
  #package {'java':
  #  ensure => present,
  #}
  
  file {'/opt/minecraft/eula.txt':
    ensure => file,
    content => 'eula=true',
  }
  file {'/etc/systemd/system/minecraft.service':
    ensure => file,
    source => 'puppet:///modules/minecraft/minecraft.service',
  }
  service {'minecraft':
    ensure => 'running',
    enable => true,
  }
}
