vagrant how-to:
 - install visrtual box -> https://www.virtualbox.org/wiki/Downloads
 - install vagrant -> https://www.vagrantup.com/downloads.html
   >> vagrant -v
   >> echo %VAGRANT_HOME%
   
   >> C:\HashiCorp\Vagrant\embedded\gems\gems\vagrant-2.0.2\bin
   >> #!/usr/bin/env ruby
   >> Encoding.default_external = Encoding.find('Windows-1251') //!!!!
   >> Encoding.default_internal = Encoding.find('Windows-1251') //!!!
   
 - add basic 'box'
   >> vagrant add box ubuntu/trusty64
 - run vagrant machine 
   >> vagrant up
 - login to vagrant machine
   >> vagrant ssh