# == Class: clamav::package
#
# Used to control the installation and configuration of ClamAV 
#
# === Parameters
#
# === Variables
#
# === Examples
#
#  class { clamav::package:
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
class clamav::package (
  $packages = false,
) {

  $defaults = {'ensure' => 'installed'}

  if $packages and !empty($packages) {
    create_resources(package, $packages, $defaults)
  }

}
