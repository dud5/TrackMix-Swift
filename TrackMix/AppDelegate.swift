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
        self.track = Track()
        self.track.volume = 0.0
        self.updateUserInterface()
    }

    func applicationWillTerminate(aNotification: NSNotification) {
        // Insert code here to tear down your application
    }


    @IBAction func mute(sender: NSButton) {
        NSLog("Received a mute: message")
        self.track.volume = 0.0
        self.updateUserInterface()
    }
    
    @IBAction func takeFloatValueForVolumeFrom(sender: AnyObject) {
        var senderName: String
        var floatValue: Float
        if sender as NSObject == self.textField {
            senderName = "textfield"
            floatValue = self.textField.floatValue
        }
        else {
            senderName = "slider"
            floatValue = self.slider.floatValue
        }
        
        self.track?.volume = floatValue
        self.updateUserInterface()
        
        NSLog("%@ sent takeFloatValueForVolumeFrom: with value %1.2f", senderName, floatValue)
    }
    
    func updateUserInterface() {
        if let newVolume = track?.volume {
            self.textField.floatValue = newVolume
            self.slider.floatValue = newVolume
        }
    }
}

