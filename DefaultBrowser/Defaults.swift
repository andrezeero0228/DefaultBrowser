//
//  Defaults.swift
//  DefaultBrowser
//
//  Created by Cameron Little on 11/2/15.
//  Copyright © 2015 Cameron Little. All rights reserved.
//

import Foundation

private enum DefaultKey: String {
    case OpenWindowOnLaunch
    case DetailedAppNames
    case PrimaryBrowser
    case BrowserBlacklist
}

// default values for this application's user defaults
// (it's confusing, because the user specific settings are called defaults)
let defaultSettings: [String: AnyObject] = [
    DefaultKey.OpenWindowOnLaunch.rawValue: true as AnyObject,
    DefaultKey.DetailedAppNames.rawValue: false as AnyObject,
    DefaultKey.PrimaryBrowser.rawValue: "" as AnyObject,
    DefaultKey.BrowserBlacklist.rawValue: [] as AnyObject
]

class ThisDefaults: UserDefaults {
    // Open the preferences window on application launch
    var openWindowOnLaunch: Bool {
        get {
            return bool(forKey: DefaultKey.OpenWindowOnLaunch.rawValue)
        }
        set (value) {
            set(value, forKey: DefaultKey.OpenWindowOnLaunch.rawValue)
        }
    }
    
    // Show application version in list
    var detailedAppNames: Bool {
        get {
            return bool(forKey: DefaultKey.DetailedAppNames.rawValue)
        }
        set (value) {
            set(value, forKey: DefaultKey.DetailedAppNames.rawValue)
        }
    }
    
    // The user's primary browser (their old default browser)
    var primaryBrowser: String {
        get {
            return string(forKey: DefaultKey.PrimaryBrowser.rawValue)!
        }
        set (value) {
            set(value as NSString, forKey: DefaultKey.PrimaryBrowser.rawValue)
        }
    }
    
    // a list of browsers to never set as default
    var browserBlacklist: [String] {
        get {
            return stringArray(forKey: DefaultKey.BrowserBlacklist.rawValue)!
        }
        set (value) {
            setValue(value, forKey: DefaultKey.BrowserBlacklist.rawValue)
        }
    }
}
