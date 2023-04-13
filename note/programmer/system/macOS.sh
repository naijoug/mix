#!/bin/bash
# macOS setup shell

# install homebrew  | https://github.com/Homebrew/brew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# install iTerm2    | https://github.com/gnachman/iTerm2
$ brew cask install iterm2
# install oh-my-zsh | https://github.com/ohmyzsh/ohmyzsh
$ sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# install developer tools
$ brew install gh               # GitHub CLI    | https://github.com/cli/cli
$ sudo gem install cocoapods    # cocoapods     | https://github.com/CocoaPods/CocoaPods
$ brew install carthage         # carthage      | https://github.com/Carthage/Carthage
$ brew install fastlane         # fastlane      | https://github.com/fastlane/fastlane
$ brew install mitmproxy        # mitmproxy     | https://github.com/mitmproxy/mitmproxy

# install software
$ brew install --cask openinterminal    # open in terminal  | https://github.com/Ji4n1ng/OpenInTerminal
$ brew install --cask squirrel          # Rime for macOS    | https://github.com/rime/squirrel