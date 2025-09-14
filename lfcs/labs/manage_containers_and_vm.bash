# 1. what does virsh destroy do ?
# answer: it forces VM to stop

# 2. Which of the following commands would you use to set the virtual machine called VM1 to automatically start up at boot?
virsh autostart VM1

# 3. Which of the following commands would you use to set the virtual machine called VM1 to automatically start up at boot?
docker ps -a

# 4. Pull docker.io/library/nginx image on this system.
docker pull docker.io/library/nginx
docker images # verify the image is pulled

# 5. Create and run a new Docker container based on the docker.io/library/nginx image. Three command line options should be used:
# A. The option to detach from this container's input/output (so you're not stuck inside the container once you run your command)
# B. The option to map port 1234 on the host to port 80 on the container
# C. The option to name this new container as website
docker run -d -p 1234:80 --name website docker.io/library/nginx

# 6. Remove the docker.io/library/nginx docker image
docker images 
docker ps -a # check the containers that still using the image

# stop and remove containers
docker stop website
docker rm website

# remove image 
docker rmi docker.io/library/nginx

# 7. Remove all docker containers (including running, stopeed containers) fromm this system 
docker ps -a
docker stop abc
docker rm abc

# 8. Use the image called httpd to create and run an Apache web server. Bind port 9080 on the host to port 80 of the container. 
# Set the restart policy so that this container always restarts if it stops unexpectedly or the system reboots. Name the container webinstance1.
docker run -d -p 9080:80 --restart always --name webinstance1 httpd

# 9. We have virsh utility installed that lets us interact with virtual machines and qemu-kvm installed that lets us create and run them.
# Check if any virtual machine is present on this system (stopped or running). If yes, then save its name in the /home/bob/vm file.
virsh list --all
echo "VM1" > /home/bob/vm

# 10. In the previous question, you might have noticed that VM1 is in shut off state; start this VM.
virsh start VM1

# 11. Now, completely remove the VM1 virtual machine.
virsh destroy VM1
virsh undefine VM1

# 12. We have a configuration file /opt/testmachine2.xml on this system.
# Create a virtual machine using this configuration file, and make sure to start it.

cat /opt/testmachine2.xml # check the xml file first (mainly to see the VM name). But can also use virsh list --all after define
virsh define /opt/testmachine2.xml
virsh start VM2

# 13. Right now, when we start up or reboot this system, the virtual machines on it have to be manually started.
# But we want VM2 virtual machine to start up automatically at boot.

virsh dominfo VM2 # check first, if autostart enabled for this VM
virsh autostart VM2 # enable autostart

# 14. Change the memory size for VM2; set its value to 80M.
# Make sure the changes are in effect; you can verify the same using sudo virsh dominfo VM2 command.

virsh dominfo VM2 # currently, the memory is 128000 KiB

virsh setmaxmem VM2 80M --config
virsh setmem VM2 80M --config
virsh shutdown VM2
virsh destroy VM2
virsh start VM2

# 15. There is a cloud image available in /var/lib/libvrt/images/ folder use that image to spin up the virtual machine with the following details
# Name - kk-ubuntu
# Memory - 1024 
# vcpus - 1 
# disk path - /var/lib/libvirt/images/ubuntu-22.04-minimal-cloudimg-amd64.img
# os-variant - ubuntu22.04 
# graphics -  none 
# network - default

virt-install \
--name kk-ubuntu \
--vcpus 1 \
--memory 1024 \
--disk /var/lib/libvirt/images/ubuntu-22.04-minimal-cloudimg-amd64.img \
--osinfo ubuntu22.04 \
--graphics none \
--network default \
--import