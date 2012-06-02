package { "resolvconf":
    ensure => installed,
}

package { "dnsmasq":
    ensure => installed,
}

file { "/etc/dnsmasq.d/tunlr.dns":
  require => Package['dnsmasq'],
  ensure  => file,
  source  => "puppet:///modules/dnsmasq/tunlr.dns",
}

service { "dnsmasq":
  hasstatus => true,
  enable    => true,
  ensure    => running,
  subscribe  => File["/etc/dnsmasq.d/tunlr.dns"],
}
