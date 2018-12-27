class httpd::install 
{
package { 'httpd' :
          ensure => 'present'
        }
file { '/etc/httpd/conf/httpd.conf' :
         ensure => 'present',
         source => 'puppet:///modules/httpd/httpd.conf',
         mode   => '0755',
     }
service {'httpd':
        ensure => 'running'
     }
}
