#
# Cookbook Name:: ntp
# Recipe:: default
#
# Copyright 2013, Tikal Knowledge
#
# Apache 2.0 license
#


package "ntp" do				# "ntp" applies to both ubuntu and centos 
    action [:install]				# install package
end
 
service node[:ntp][:service] do
    service_name node[:ntp][:service]         
    action [:enable,:start,:restart]                   
end

template "/etc/ntp.conf" do			# create / edit the /etc/ntp.conf file
    source "ntp.conf.erb"			# defaults to templates/files/...
    owner "root" 				# set file owner
    group "root"				# set file group
    mode 0644					# set file mode
    notifies :restart, resources(:service => node[:ntp][:service])#, :delayed
end


