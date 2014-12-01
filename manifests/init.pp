# == Class: clamav
#
# Used to control the installation and configuration of ClamAV 
#
# === Parameters
#
# === Variables
#
# === Examples
#
#  class { clamav:
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
class clamav (
  $services       = false,
  $clamd_config         = hiera_hash('clamav::clamdconfiguration', false),
  $service_config         = hiera_hash('clamav::serviceconfiguration', false),
  $clamd_conf_file      = '/etc/clamav/clamd.conf',
  $clamd_file_status    = 'present',
  $service_conf_file      = '/etc/clamav/freshclam.conf',
  $service_file_status    = 'present',
)
{

  if !$clamd_config {
    fail('You must define configuration in hiera where the keys are expected keys in the configuration and the values the config values')
  }
  if !$service_config {
    fail('You must define configuration in hiera where the keys are expected keys in the configuration and the values the config values')
  }

  validate_hash($clamd_config)
  validate_hash($service_config)

  class { 'clamav::package': } ->

  class { 'clamav::config': } ->

  class { 'clamav::service':
    services => $services
  }

}
