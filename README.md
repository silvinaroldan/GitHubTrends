# GitHubTrends

Swift app that list trending projects on Github and when tap on one of them it shows their details.

### Getting Started

This project makes use of cocoapods as dependency manager for third party libraries used in the project.

As is requested I use MVVM pattern. I also use Coordinator pattern for navigation.

I'm using Swift 5.x as the language for development.

I use [SwiftLint](https://github.com/realm/SwiftLint) tool to enforce some style and conventions.

### Prerequisites

What things you need to install the software and how to install them:

1) Development IDE - XCode 10.2 + 

2) Operating System - macOS Mojave 10.14.3

3) Dependency manager - Cocoapods 


### Support levels

1) Deployment Target - iOS 12.2

### Project setup

Steps to get the project ready:

1) Install cocoapods (sudo gem install cocoapods).

2) Once cocoapods is installed in your machine, go to Project directory and Run "pod install".

### Xcode Configurations

I added "API_BASE_URL" and "DEBUG_ALERTS" as User defined configuration on Build seetings to manage  the defaults release and debug environments as is described [here](https://medium.freecodecamp.org/managing-different-environments-and-configurations-for-ios-projects-7970327dd9c9). Since this is a test project I didn't add another schemas.


### Note:
From what I see, there is no GitHub API to get list of trending repositories. As is suggested [here](https://stackoverflow.com/questions/30525330/how-to-get-list-of-trending-github-repositories-by-github-api) I list the trendy repositories using the [Search Github API](https://developer.github.com/v3/search/) to get the most starred repositories.
