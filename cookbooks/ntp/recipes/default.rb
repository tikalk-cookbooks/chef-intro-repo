#
# Cookbook Name:: ntp
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#


package "ntp" do				# "ntp" applies to both ubuntu and centos 
    action [:install]				# install package
end
 
template "/etc/ntp.conf" do			# create / edit the /etc/ntp.conf file
    source "ntp.conf.erb"			# defaults to templates/files/...
    owner "root" 				# set file owner
    group "root"				# set file group
    mode 0644					# set file mode
    notifies :restart, service_name node[:ntp][:service]		# restart service as post config action
end
 
service "ntpd" do
    service_name node[:ntp][:service]		# see 
    action [:enable,:start]			# use chkconfig on centos | update-rc.d on ubutnu
end
