Menu: [Home](../../README.md)

## App Localization

![Screenshot](screenshot-small.png)

### Overview

### Adding a Language
From Project Screen:
Editor -> Add Localization
Editor -> Export

### In Code
```swift
private func findAppLanguage() {
   let localeIdentifier = Locale.current.identifier
   print("Locale: \(localeIdentifier)")

   let preferredLanguage = Bundle.main.preferredLocalizations.first!
   print("preferredLanguage: \(preferredLanguage)")
}
```
The preferredLanguage will contain the language only if it's one of your supported languages.  If you put the simulator or device in German, for example, and you don't support that language, preferredLanguage would default to English.

The localeIdentifier will change to de, however.

Note, for projects with multiple targets, you must select the Main.storyboard and localize it independently.

```swift
NSLocalizedString("Hello", comment: "a useful comment")
```

### Verify Localiztion Files

```sh
 /usr/bin/plutil -lint ../../en.lproj/zh-Hans.lproj/Localizable.strings
 ```
 
 ### InfoPlist.strings
 mb2:en.lproj melling$ mr es.lproj/InfoPlist.strings
 ```
 /* Localized versions of Info.plist keys */
 
 /*
 http://stackoverflow.com/questions/18052468/xcode-cannot-locate-localized-info-plist
 */
 
 "CFBundleDisplayName" = "Francés Lite";
 "CFBundleName" = "Francés Lite";
 ```
### Localized Screenshots

### References

- [iOS Localization QuickStart tutorial](https://www.youtube.com/watch?v=YpNU6HbkMjQ)
- [What’s new in localization in Xcode 9 and iOS 11](http://www.ibabbleon.com/copywriter-translator/2017/06/whats-new-in-localization-in-xcode-9-ios-11/)
- [About Internationalization and Localization](https://developer.apple.com/library/content/documentation/MacOSX/Conceptual/BPInternational/Introduction/Introduction.html)
- [Apple Internationalization Page](https://developer.apple.com/internationalization/)
