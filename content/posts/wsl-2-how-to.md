---
title: "How to setup WSL on Windows 10"
date: 2020-06-19T09:10:43-05:00
---

### What is WSL?
![MS<3Linux](https://raw.githubusercontent.com/sourajitk/sourajitk.github.io/source/data/wsl%20blog%20assests/ms_loves_linux.png?token=AKZAGQJX3TSACHFBWW6MII27AFGS4)

WSL or Windows Subsystem for Linux is a compatibility layer for running Linux binary executables natively on Windows 10 and Windows Server 2019. WSL has been one of the most useful features of Windows 10. 

Things became even more delightful when Microsoft announced back in May 2019 that, they will be shipping a full `Linux kernel` with version `2` of WSL. This meant that anything that required significant processing power, could now be run using WSL 2 with full GPU and CPU accleration. It also brought along filesystem improvements which furthur enhanced the performance of it. 

In April 2020, WSL 2 came out of beta and was available to be used in Windows 10 April Update `Build 2004`. In the future, Microsoft has plans to default completely to WSL 2 instead of WSL 1.

### How to setup WSL on your Windows 10 powered machine
Before starting, I would like to mention that in this guide, we will be setting up WSL 2.

First, we need to enable some essential Windows 10 components to get WSL up and running. For WSL 2 specifically, we would be needing `Virtual Machine Platform` and `Windows Subsystem for Linux` features to be turned on.

![Featctrl](https://raw.githubusercontent.com/sourajitk/sourajitk.github.io/source/data/wsl%20blog%20assests/feat%20ctrl.png?token=AKZAGQO4SRKTOIYNBP3IFWC7AFGQS)

To enable the aforementioned features, head to the start menu and type `Windows Features` and choose the first option. 

![WinFeat](https://raw.githubusercontent.com/sourajitk/sourajitk.github.io/source/data/wsl%20blog%20assests/vm%20plat.png?token=AKZAGQPLSMCVM4ZO665GT6C7AFGVO) 

VM Platform 

![WSLFeat](https://raw.githubusercontent.com/sourajitk/sourajitk.github.io/source/data/wsl%20blog%20assests/wsl%20feat.png?token=AKZAGQIJJ77PHE65J5C42NS7AFGWW)

Main WSL component 


After enabling the above features, you will have to reboot your machine. The two components we enabled should now be active and ready to be used.

### Setting WSL 2 as the default option
As of `Build 2004`, WSL 1 is still the default option. This might eventually change with upcoming updates but for now, we need to tell Windows to default to WSL 2. To do that, open up command prompt and type in the following:

```
wsl --set-default-version 2
```
This will ensure that whenever a new WSL Linux distro is installed, it uses WSL 2 by default.

### Troubleshooting: Error 0x1bc
If you encounter the above error, download and install this WSL 2 update [package](https://wslstorestorage.blob.core.windows.net/wslblob/wsl_update_x64.msi) from Microsoft. After you have installed the update, try the command to set WSL 2 as default again.

### Downloading Ubuntu 20.04 for WSL from the Windows Store
Now that the features have been enabled, we will now head to the Microsoft Store and install Ubuntu 20.04.

![ubuntu](https://raw.githubusercontent.com/sourajitk/sourajitk.github.io/source/data/wsl%20blog%20assests/ubuntu.png?token=AKZAGQP4AL7FDWWJEW64LKS7AFGUI)

Click on install. It'll take a few minutes and once it's done, click on Launch. Upon launching Ubuntu, it'll extract the system image and ask for an username and password. After you are done filling those in, type in the following commands to ensure everything's up-to-date.

```bash
$ sudo apt-get update

$ sudo apt-get upgrade
```
That's it! You've now successfully installed Ubuntu 20.04 on your Windows 10 machine using WSL 2. We can confirm that we are running WSL 2 by typing the following in CMD:

```
wsl --list --verbose 
```
The output should be:

![wsl2yay](https://raw.githubusercontent.com/sourajitk/sourajitk.github.io/source/data/wsl%20blog%20assests/wsl2yay.png?token=AKZAGQOVYL2XMIVIZ4CPLNK7AFGX4)

Check out the `Extras` for some more cool stuff!

### Extras: Shortcut to WSL File-system
There is a neat way to access the files stored in your WSL VM. Follow the steps below to access the contents yourself on your Windows 10 PC.

1. Create a shortcut (preferably on your desktop you can move the shortcut around later)

![](https://raw.githubusercontent.com/sourajitk/sourajitk.github.io/source/data/wsl%20blog%20assests/shortcut.png)

2. Copy and paste this  ```\\wsl$\``` in the address bar box, press on next and then finish to the create shortcut. After double clicking the newly created shortcut, you should see the name of your WSL distro and double clicking that should reveal the Linux rootfs. Navigating to home -> "your username" and you should see your files. 

Tip: When creating the shortcut, type in the path to your home directory as that's the place where you'll have all your files. Just change the directory to ```\\wsl$\Ubuntu-20.04\home\<username>``` and the shortcut should take you to your Linux home directory.

### Extras: Custom Kernel
The default kernel that WSL 2 ships with is `4.19.104-microsoft-standard` and it primarily focuses on stability. However, since this is a real Linux kernel, we can replace it by using a more up-to-date custom one. To do this, we would be using [Nathan Chancellor's](https://github.com/nathanchance) mainline based kernel for WSL 2. Follow the steps below to get the latest kernel for yourself.

1. Download the latest kernel release from his WSL 2 kernel git [here](https://github.com/nathanchance/WSL2-Linux-Kernel/releases). Make sure you have this in the root of your `Users` directory as in `C:\Users\YourUserName\`. 

    Here I saved it as `kernel` you can name it anything you want to (or leave it as it is).

2. Now we would wanna shutdown WSL. To do that open up CMD and type in the following:

Note: This will shutdown WSL completely and any unsaved work will be lost.

```
wsl --shutdown
```

3. Now we need to create a file with the name `.wslconfig` in the root of your user's home directory. Now open this file using notepad and add the following:

```
[wsl2]
kernel = C:\\Users\\Your User Name\\kernel
```
Save the file and exit notepad.

4. Now it's time to fire up Ubuntu again. To do that, just open `Ubuntu` from the start menu and run:

```bash
$ cat /proc/version
```

If it worked the output would be:

```bash
~/prince(source) » cat /proc/version
Linux version 5.8.0-rc1-next-20200618-microsoft-cbl (nathan@Ryzen-9-3900X) (ClangBuiltLinux clang version 11.0.0 (https://github.com/llvm/llvm-project b21794a91ccc3b6000f05f1080dbce30455c7061), LLD 11.0.0 (https://github.com/llvm/llvm-project b21794a91ccc3b6000f05f1080dbce30455c7061)) #1 SMP Thu Jun 18 00:53:16 MST 2020
```

And that is it! 

A newer and upstreamed kernel would basically keep your OS running more securely and more efficiently.

### My Setup
![homescreen](https://raw.githubusercontent.com/sourajitk/sourajitk.github.io/source/data/wsl%20blog%20assests/homescreen.png?token=AKZAGQLTWSMBOGSLTF6E2A27AFGRU)