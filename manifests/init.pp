# == Class: clamav
#
# Used to control the installation and configuration of ClamAV 
#
# === Parameters
# 
# This module expects hashes stored in hiera, see the following examples.
#  
# clamav::cronsetup:
#   clamav:
#     command: '/usr/bin/clamscan / --recursive --bell'
#     user: 'root'
#     hour: '*/12'
#     minute: '0'
#
# clamav::packages:
#   clamav:
#     ensure: 'present'
#
# clamav::services:
#   clamav-freshclam:
#     ensure: 'running'
#     enable: 'true'
#
# clamav::clamdconfiguration:
#   LocalSocket: '/var/run/clamav/clamd.ctl'
#   FixStaleSocket: 'true'
#   LocalSocketGroup: 'clamav'
#   (continued...)
#
# clamav::serviceconfiguration:
#   DatabaseOwner: 'clamav'
#   UpdateLogFile: '/var/log/clamav/freshclam.log'
#   LogVerbose: 'false'
#   (continued...)
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
    fail('Please define a hash in hiera containing key/values for clamav::clamdconfiguration')
  }
  if !$service_config {
    fail('Please define a hash in hiera containing key/values for clamav::serviceconfiguration')
  }

  validate_hash($clamd_config)
  validate_hash($service_config)

  class { 'clamav::package': } ->

  class { 'clamav::config': } ->

  class { 'clamav::service':
    services => $services
  }

}
