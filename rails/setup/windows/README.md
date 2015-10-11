# Ruby on Rails in Windows
Ruby on Rails supports on Windows has been known to be lagging behind from Linux and Mac.
After several attempts trying to install Ruby on Rails on Windows, I would suggest the following
methods if possible:

## Option #1 - VMWare Player Virtual Machine
If you can't afford dual-boot  (e.g: using an office laptop etc) and you have no idea how to do it, then VMWare Player virtual machine would be a good choice and ultimate recommendation due to its simplified supports.

### Installation
1. Go to VMWare Player https://www.vmware.com/products/player and install the player software.
2. If you have an existing VM with Ubuntu installed, go to the folder, double click the .vmx to start. Else, skip to step 3.
3. Follow http://processors.wiki.ti.com/index.php/How_to_Build_a_Ubuntu_Linux_host_under_VMware.
4. Then follow the Rails setup for Ubuntu that can be found here https://github.com/hollowaykeanho/learning/tree/master/rails/setup.


## Option #2 - Use Cloud 9 virtualization
Cloud 9 allows virtual hosting in clouds. That said you'll need internet for everyday development.
It's an easy deployed without much complication.

> NOTE:
>
> C9 free edition is community based. It simply means open-source for others to view.
> Consider purchasing their plan for private location.

1. Go to https://c9.io/.
2. Sign-up for an account.
3. Deploy a custom ubuntu machine and you're ready to go.

## Option #3 - Dual Boot (Pro Techie)
> WARNING:
>
> You should have a decent computer science knowledge in terms of bootloader, dual partitioning and data-backup before attempting this option.
> Otherwise, if you don't have any idea with the mentioned technologies, go back to option #1.

Depending on OSes and machines, dual boot allows maximum hardware usage compared to VM solution.

### Installation
> WARNING:
>
> ***Backup your data before performing dual-boot installation!***
> Failure can results in complete data losses, including the Windows partition being wiped out.

1. Follow this guide for Windows 8 and above:

***Basic***: http://www.everydaylinuxuser.com/2014/05/install-ubuntu-1404-alongside-windows.html

***Expert in computer science***: https://www.quora.com/How-do-I-dual-boot-Ubuntu-14-04-with-Windows-8-1

> NOTE:
>
> You'll face boot menu problem (a.k.a "bootloader issue") occasionally whenever Windows or Ubuntu is being updated.
> Please be prepared to learn some bootloader troubleshooting for thinkering through the issue.
