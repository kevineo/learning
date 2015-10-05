# Ruby on Rails in Windows
Ruby on Rails supports on Windows has been known to be lagging behind from Linux and Mac.
After several attempts trying to install Ruby on Rails on Windows, I would suggest the following
methods if possible:

## Option #1 - Dual Boot

Depending on OSes and machines, dual boot is the ultimate preference and recomemndation.

1. Follow this guide for Windows 8 and above:

***Basic***: http://www.everydaylinuxuser.com/2014/05/install-ubuntu-1404-alongside-windows.html

***Expert in computer science***: https://www.quora.com/How-do-I-dual-boot-Ubuntu-14-04-with-Windows-8-1


> Note:
> You'll face boot menu problem (a.k.a "bootloader issue") occasionally whenever Windows or Ubuntu is being updated.
> Please be prepared to learn some bootloader troubleshooting for thinkering through the issue.

## Option #2 - VMWare Player Virtual Machine
If you can't afford dual-boot, e.g: using an office laptop etc, then VMWare Player virtual machine would be a good choice.

1. Go to VMWare Player https://www.vmware.com/products/player and install the player software.
2. If you have an existing VM with Ubuntu installed, go to the folder, double click the .vmx to start. Else, skip to step 3.
3. Follow http://processors.wiki.ti.com/index.php/How_to_Build_a_Ubuntu_Linux_host_under_VMware.
4. Then follow the Rails setup for Ubuntu that can be found here https://github.com/hollowaykeanho/learning/tree/master/rails/setup.
