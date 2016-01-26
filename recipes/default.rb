#
# Cookbook Name:: garage-pc
# Recipe:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

#Istall Spotify
directory 'c:\temp' do
  action :create
end

remote_file 'c:\temp\SpotifySetup.exe' do
  source node['garage-pc']['spotify_exe']
end

execute 'Setup spotify' do
 command <<-EOH
    c:\\temp\\SpotifySetup.exe /q /s
  EOH
  action :run
  not_if do ::File.exists?('C:/Users/Vagrant/AppData/Local/Spotify') end
end

#Install Chrome
remote_file 'c:\temp\ChromeSetup.msi' do
  source node['garage-pc']['chrome_msi']
end

execute 'Setup chrome' do
 command <<-EOH
   msiexec /q /i c:\\temp\\ChromeSetup.msi
  EOH
  action :run
  not_if do ::File.exists?('C:/Program Files (x86)/Google/Chrome') end
end

#add user

user 'garage-pc'do
  password 'garage123'
  action :create
end