# -*- mode: ruby -*-
# vi: set ft=ruby :

MIRROR=ENV['MIRROR'] || 'us.archive.ubuntu.com'

update = <<SCRIPT
if [ ! -f /tmp/up ]; then
  sudo sed -i.bak "s/us.archive.ubuntu.com/#{MIRROR}/g" /etc/apt/sources.list
  sudo sed -i.bak '/deb-src/d' /etc/apt/sources.list
  sudo apt-get update 
  touch /tmp/up
fi
SCRIPT

Vagrant.configure("2") do |config|

  config.vm.define :gitblit do |node|
    bridge = ENV['VAGRANT_BRIDGE'] || 'eth0'

    env  = ENV['PUPPET_ENV']|| 'dev'

    hiera = ENV['HIERA'] || 'hiera_vagrant'

    node.vm.box = 'ubuntu-16.04_puppet-3.8.7' 
  
    node.vm.provider :virtualbox do |vb, override|
	vb.customize ['modifyvm', :id, '--memory', 2048, '--cpus', 2]
	override.vm.network :public_network, :bridge => bridge, :mac => '525400438296'
    end

    node.vm.provider :libvirt do |domain,o|
	domain.uri = 'qemu+unix:///system'
	domain.host = 'gitblit.local'
	domain.memory = 2048
	domain.cpus = 2
	o.vm.synced_folder './', '/vagrant', type: 'nfs'
    end

    node.vm.provision :shell, :inline => update
    node.vm.provision :puppet do |puppet|
	puppet.manifests_path = 'manifests'
	puppet.manifest_file  = 'default.pp'
	puppet.options = "--modulepath=/vagrant/modules:/vagrant/static-modules --hiera_config /vagrant/#{hiera}.yaml --environment=#{env}"

    end
  end

end
