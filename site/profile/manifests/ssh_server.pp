class profile::ssh_server {
  package {'openssh-server':
    ensure => present,
  }
  service {'sshd':
    ensure => 'running',
    enable => true,
  }
  ssh_authorized_key {'root@master.puppet.vm':
    ensure => present,
    user   => 'root',
    type   => 'ssh-rsa',
    key    => 'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC4ykh71tgEM/gANj6AGj1zxiMbjrHajZuFr2yqP8Q/uK0MDznxZ4c7VAfy7DuiYBSOgxnnrAQtnxwcLxjOECY477wDDrmUOC83XJWtUTrOkSXIMAnQTn3WFICUj5Fsa17eGl8rel9aoZV2V06zwoh7N//Wbq1MIVsAMl17JCANos/nZEVkbEvPoeAJNM5aSi9HKzM2hwdBe7SbEYBoxtW3YdzjDh808A4gi802Fi1xSf7XCGtWjnQqRYpABG/2X75ywLtpad2HhzrXl9rnHy2FwARtDJe5mjAuFWSd6aWL+co8Vdh8Xh7ljkLW5sp11HsOagBYxeRUNtadOdMT62fZ root@master.puppet.vm',
  }
}
