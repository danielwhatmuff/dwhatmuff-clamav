# == Class: clamav::config
#
# Used to control the configuration of ClamAV 
#
# === Parameters
#
# === Variables
#
# === Examples
#
#  class { clamav::config:
#  }
#
# === Authors
#
#  Daniel Whatmuff <danielwhatmuff@gmail.com>
#
# === Copyright
#
# Copyright 2014 Daniel Whatmuff 
#
class clamav::config
{

  file { $clamav::clamd_conf_file:
    ensure    => $clamav::clamd_file_status,
    mode      => '0644',
    owner     => 'root',
    group     => 'root',
    content   => template("${module_name}/${clamav::clamd_conf_file}.erb"),
  }

  file { $clamav::service_conf_file:
    ensure    => $clamav::service_file_status,
    mode      => '0644',
    owner     => 'root',
    group     => 'root',
    content   => template("${module_name}/${clamav::service_conf_file}.erb"),
  }

}
