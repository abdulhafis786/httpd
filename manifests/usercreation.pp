class httpd::usercreation
(
$user           = $httpd::user,
$group          = $httpd::group,
$home_dir       = '/home/developer',
)
{
 user { $user :
       ensure => 'present',
       groups => $group,
       uid    => '1010',
       managehome => true,
       home => $home_dir,
       require => Group[$group]
      }
 group { $group :
      ensure => 'present'
           }
}
