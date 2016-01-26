Vagrant.configure('2') do |config|
  config.vm.network 'forwarded_port', guest: 80, host: 8880
  config.vm.communicator = "winrm"
end
