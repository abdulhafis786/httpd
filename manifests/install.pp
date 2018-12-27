class httpd::install 
(
$mode           = $httpd::mode,
$httpd_port     = $httpd::httpd_port,
$httpd_conf_dir = $httpd::httpd_conf_dir,
$package_name   = $httpd::package_name,
)
{
package {  $package_name :
          ensure => 'present'
        }
file { "${httpd_conf_dir}/httpd.conf" :
         ensure => 'present',
         #source => 'puppet:///modules/httpd/httpd.conf',
         content => template('httpd/http.conf.erb'),
         mode   => $mode,
     }
service { $package_name :
        ensure => 'running',
        subscribe => File ["${httpd_conf_dir}/httpd.conf"]
     }
}
