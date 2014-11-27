//
//  AppDelegate.swift
//  TrackMix
//
//  Created by eduardo on 27/11/14.
//  Copyright (c) 2014 Rdomunoz. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    @IBOutlet weak var window: NSWindow!
    @IBOutlet weak var textField: NSTextField!
    @IBOutlet weak var slider: NSSlider!
    
    var track: Track!

    func applicationDidFinishLaunching(aNotification: NSNotification) {
        track = Track()
    }

    func applicationWillTerminate(aNotification: NSNotification) {
        // Insert code here to tear down your application
    }


    @IBAction func mute(sender: NSButton) {
        NSLog("Received a mute: message")
    }
    
    @IBAction func takeFloatValueForVolumeFrom(sender: AnyObject) {
        var senderName: String
        if (sender as NSObject == self.textField) {
        senderName = "textfield"
        }
        else {
            senderName = "slider"
        }
        
        NSLog("%@ sent takeFloatValueForVolumeFrom: with value %1.2f", senderName, slider.floatValue)
    }
}

