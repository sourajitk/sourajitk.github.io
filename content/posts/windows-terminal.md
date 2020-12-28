---
title: "Customizing the Windows Terminal"
date: 2020-07-23T10:24:00-05:00
---
### What is Windows terminal?

![TerminalPreview](https://raw.githubusercontent.com/sourajitk/sourajitk.github.io/source/data/windows%20terminal%20assests/terminalpreview.png?token=AKZAGQMNTADJOMBJBZHGAJK7AFM6E)

Windows Terminal is a terminal emulator for Windows 10 written by Microsoft. It includes support for the Command Prompt, PowerShell, [WSL]( https://sourajitk.github.io/posts/wsl-2-how-to/) and SSH. After the initial source code release on GitHub, a preview release was first published to the Microsoft Store on June 21, 2019.

Another cool thing about Windows Terminal is that it's [open-source](https://github.com/microsoft/terminal). What this means is that the code that was used to build Windows Terminal is publicly available for you or anyone else to modify! 

What makes Windows Terminal stand out is that it uses a GPU accelerated DirectWrite/DirectX-based text rendering engine. This new text rendering engine will display text characters, glyphs, and symbols present within fonts on your PC, including CJK ideograms, emoji, powerline symbols, icons, programming ligatures, etc. This engine also renders text much faster than the previous Console’s GDI engine!

In this guide, we are going to be focusing on the Windows Store version of Windows Terminal. This process involves us modifying the JSON config file that contains all the settings for the Windows Terminal.

### Downloading Windows Terminal from the Microsoft Store

![WTStore](https://raw.githubusercontent.com/sourajitk/sourajitk.github.io/source/data/windows%20terminal%20assests/wtstore.png?token=AKZAGQISAW46SEFFG7VF4VC7AFM7A)

You can find the link to the app [here]( https://www.microsoft.com/en-us/p/windows-terminal/).

Press on launch after it has been installed.

![Initialscreen](https://raw.githubusercontent.com/sourajitk/sourajitk.github.io/source/data/windows%20terminal%20assests/intialscreen.png?token=AKZAGQPVJG525KUKH222SNC7AFM4Q)

### Opening the JSON config file

First, you need to open up the menu and then press on Settings. Alternatively, you can use Ctrl+, as well for the same.

![menu](https://raw.githubusercontent.com/sourajitk/sourajitk.github.io/source/data/windows%20terminal%20assests/menu.png?token=AKZAGQM54JUSFFU4ITC4HRK7AFM52)

As you click on the Settings option, you should see a notepad window show up. This is the JSON file which is basically the configuration file for Windows Terminal. I would recommend you to install [Visual Studio Code](https://code.visualstudio.com/download) as it makes editing the JSON much easier.

![json-file](https://raw.githubusercontent.com/sourajitk/sourajitk.github.io/source/data/windows%20terminal%20assests/json-file.png?token=AKZAGQN7W5QEBBAOWZ6BM5S7AFM5A)

Assuming you’ve already installed Visual Studio Code and opened the JSON file, let’s start customizing!

### Quick Tip

Before we proceed, you might want to set the ```"copySelect"``` value to ```true``` as it’s very useful.

### Themes

There are 9 included themes that Windows Terminal ships with. One can set different themes for different profiles. Here, I’ve customized my WSL profile to use the Solarized Dark theme. To start using a different theme, locate the profile section in the ```settings.json``` and add ```”colorScheme”``` property to the profile you want to theme. Add this line to your profile:

```bash

    "colorScheme": "Your preferred theme name",

```
And should look something like this:

![favtheme2](https://raw.githubusercontent.com/sourajitk/sourajitk.github.io/source/data/windows%20terminal%20assests/favtheme2.png?token=AKZAGQNTYKJSU6YNWTKM7XK7AFM2K)

Other themes that I like are previewed here:

![favtheme1](https://raw.githubusercontent.com/sourajitk/sourajitk.github.io/source/data/windows%20terminal%20assests/favtheme1.png?token=AKZAGQNH7AKHFNX5IYQWLRK7AFMY2)

One Half Dark

![favtheme3](https://raw.githubusercontent.com/sourajitk/sourajitk.github.io/source/data/windows%20terminal%20assests/favtheme3.png?token=AKZAGQIEAVSOBKDRVNEECVS7AFN52)

Vintage

### Fonts
Windows Terminal supports any monospaced fonts. We can also set a default font size. You can also change the font size on the fly by using Ctrl '+' or ‘-‘. 

Although you can get away with a non-monospaced font, I cannot guarantee you that everything will look and work as expected. To set a custom font, add the following lines:

```bash
    "fontFace": "Consolas",
    "fontSize": 11,
```
### Adding blur to the Terminal backgorund
Since the Windows Terminal is a UWP (Univeral Windows Platform) app, it supports Windows' Fluent Blur which can be enabled on the fly by holding Shift+Ctrl and scrolling up or down which will change be the transparency of the background (which is blurred). 

Note: Adjusting the blur using the above method doesn't save the values.

To hard code a permanent opacity value which by the way can be set on a per-profile basis, add these lines to your profile:

```bash
    "useAcrylic": true,
    "acrylicOpacity": <Any float value between 1.0 (fully transparent) to 0.0 (fully opaque)>,
```

### Adding icons to the menu
Paste the following path in the Explorer address bar:

```%LOCALAPPDATA%\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\RoamingState```

You should now be in an empty folder.

Here you can copy your logo in ```.PNG``` format. Make sure you download or make a low-res copy of your copy because if it’s too high res, it might end up having an over-sharpened look. 

To define your logo, add the following to your profile:

```bash
    "icon": "ms-appdata:///roaming/<your image name.png>"
```
Here’s how it should look like:

![menu_sample](https://raw.githubusercontent.com/sourajitk/sourajitk.github.io/source/data/windows%20terminal%20assests/menu_sample.png?token=AKZAGQJRG5R6JAUXKJYFRU27AHVAE)

### Changing the default starting directory

Windows Terminal starts at ```C:\Users\<User name>\``` by default but this can be changed something else on a per-profile basis. 

By adding the following line you can change the starting directory to virtually anything you want.

```bash
    "startingDirectory" : "<The path you desire>",
```

### Changing default shell

Windows Terminal starts with Powershell by default but this can be changed to anything as long as you have the ID for that app. At the very beginning of the file you should see something like ```"defaultProfile": "{07b52e3e-de2c-5db4-bd2d-ba144ed6c273}",``` here, just replace the ID with something else and Windows Terminal should start with what with selected.

### Final words

There you have it! Some pretty simple yet useful customizations that will help you personalize Windows Terminal.