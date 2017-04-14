# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

  hiera = ENV['HIERA'] || 'hieradata'
  env  = ENV['PUPPET_ENV']|| 'dev'

  config.vm.define :gitblit do |node|

    node.vm.box = 'ubuntu-16.04.1_puppet-3.8.7'
    node.vm.network :private_network, ip: '192.168.1.205'
    node.vm.hostname = 'gitblit.local' 

    node.vm.provision :puppet do |puppet|
	puppet.manifests_path = 'manifests'
	puppet.manifest_file  = 'default.pp'
	puppet.options = "--modulepath=/vagrant/modules:/vagrant/static-modules --hiera_config /vagrant/#{hiera}.yaml --environment=#{env}" 
    end
  end

end
