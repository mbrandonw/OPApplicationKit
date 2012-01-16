#OPApplicationKit - let's make an app

OPApplicationKit is an implementation of a pattern that we've come to use in most apps we develop. It's not necessarily the best pattern, and certainly some people will hate it, but it's suited us well.

There are two primary parts: 

* `OPAppDelegate` : Our app delegate will inherit from this (instead of straight from `UIResponder`), and it's primary purpose is to forward application events to `OPApplication`.
* `OPApplication` : A singleton class that we should inherit from to concentrate all global code needed in the app. This class also receives all application notifications and events (e.g. app lifecycle, remote notifications, local notifications, memory warnings, handling URLs). We hate putting any code in our app delegate, so at the very least this gives us a centralized place to handle all of these events. If we put additional global state/code in this class, the prefered way to interact with any other part of the app is through the use of `NSNotification` objects.

We also have a custom `NSManagedObject` subclass that all of our models inherit from that gives us basic created and last modified time stamp functionality. Basically, if our model has the attributes `createdAt` and/or `updatedAt`, then the model will automatically update these attributes when saving.

##Installation

We love [CocoaPods](http://github.com/cocoapods/cocoapods), so we recommend you use it.

##Demo

Checkout [OPKitDemo](http://www.opetopic.com) for a demo application using OPExtensionKit, among other things.
