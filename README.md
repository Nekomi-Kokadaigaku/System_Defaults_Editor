<div align="center">
    <img src="System_Defaults_Editor/System_Defaults_Editor/Application/Assets.xcassets/AppIcon.appiconset/mac1024.png" width=200 height=200>
    <h1>System Defaults Editor</h1>
</div>

<div align="center">
    <img src="System_Defaults_Editor/System_Defaults_Editor/Application/Assets.xcassets/screenshot.imageset/screenshot.png">
</div>

![Platform](https://img.shields.io/badge/platform-macOS-blue?style=flat-square)

System_Defaults_Editor is a tool for visualize the value of system defaults. It is a macOS application that allows users to modify system defaults in a user-friendly way. The app provides a graphical interface for users to easily change system settings without needing to use the command line.

## Features/Roadmap

- [x] Read system defaults
- [x] write system defaults
- [x] Read and write plist files
- [ ] Export plist files
- [ ] Show details of system defaults

## Usage(Development)

1. **Git clone**

```bash
git clone https://github.com/Nekomi-Kokadaigaku/System_Defaults_Editor.git
```

2. **Enter the folder**

```bash
cd System_Defaults_Editor
```

## Something need to Know

### What's a `defaults` command?([From](https://macos-defaults.com/#:~:text=macOS%20applications%20and,sometimes%20they%27re%20hidden.))

macOS applications and other programs use the defaults system to record user preferences and other information to be maintained when the application isn't running (font for new documents, or the position of an Info panel). Much of this information is accessible through an application's Preferences panel but sometimes they're hidden.

User defaults belong to domains, which typically correspond to individual applications. Applications, system services, and other programs have their own domains, they also share a domain named NSGlobalDomain. If a default isn't specified in the application's domain, it may be specified in NSGlobalDomain.

Each domain has a dictionary of keys and values representing its defaults; e.g. "Default Font" = "Helvetica". Keys are strings, values can be complex data structures comprising arrays, dictionaries, strings, and binary data. They're stored as XML Property List.

The defaults command line interface is a way to interact with these values.

### Command line interface basics

Print the help

```zsh
defaults help
```

List all domains

``` zsh
defaults domains
```

List all entries containing word

```zsh
defaults find ${word}
```

## Others

- **Data Source**: [https://macos-defaults.com/](https://macos-defaults.com/)

- **UI Framework**: [Luminare](https://github.com/MrKai77/Luminare/tree/loop-1.2.0)
