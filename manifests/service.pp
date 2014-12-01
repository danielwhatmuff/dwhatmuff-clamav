# == Class: clamav::service
#
# Used to control the installation and configuration of ClamAV
#
# === Parameters
#
# === Variables
#
# === Examples
#
#  class { clamav::service:
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
class clamav::service($services = false) {

  $defaults = {'ensure'=>'running','enable'=>'true'}

  if $services and !empty($services) {
    create_resources(service, $services, $defaults)
  }
    
}
