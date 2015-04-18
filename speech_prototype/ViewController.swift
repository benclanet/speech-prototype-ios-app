//
//  ViewController.swift
//  speech_prototype
//
//  Created by Benjamin Clanet on 3/18/15.
//  Copyright (c) 2015 Benjamin Clanet. All rights reserved.
//

import UIKit

class ViewController: UIViewController, SKRecognizerDelegate {

    var reco: SKRecognizer!
    @IBOutlet weak var btn: UIButton!
    
    override func viewDidAppear(animated: Bool) {
        
        super.viewDidAppear(animated)
        
        SpeechKit.setupWithID("NMDPTRIAL_ben_clanet20150405174219", host: "sandbox.nmdp.nuancemobility.net", port:443, useSSL:false, delegate:nil)
        SpeechKit.setEarcon(SKEarcon.earconWithName("earcon_listening.wav") as! SKEarcon, forType:UInt(SKStartRecordingEarconType))
        SpeechKit.setEarcon(SKEarcon.earconWithName("earcon_done_listening.wav") as! SKEarcon, forType:UInt(SKStopRecordingEarconType))
        SpeechKit.setEarcon(SKEarcon.earconWithName("earcon_cancel.wav") as! SKEarcon, forType:UInt(SKCancelRecordingEarconType))
        //coucou toi
    }

    @IBAction func listen(sender: UIButton) {
    
        self.btn.selected = !self.btn.selected;
        if (self.btn.selected) {
            
            self.reco = SKRecognizer(type: SKSearchRecognizerType, detection: UInt(SKShortEndOfSpeechDetection), language:"en_US", delegate: self)
        }
            
        else {
            if ((self.reco) != nil) {
                [self.reco.stopRecording()]
                [self.reco.cancel()]
            }
        }
    }
    
    func recognizer(recognizer: SKRecognizer!, didFinishWithError error: NSError!, suggestion: String!) {
        
        NSLog(error.localizedDescription);
    }
    
    func recognizer(recognizer: SKRecognizer!, didFinishWithResults results: SKRecognition!) {
        
        var res = results.results
        if let str: AnyObject = res.first {
            
            NSLog(str as! String)
        }
    }
    
    func recognizerDidBeginRecording(recognizer: SKRecognizer!) {
        
        NSLog("begin recording…")
    }
    
    func recognizerDidFinishRecording(recognizer: SKRecognizer!) {
        
        NSLog("finish recording…")
    }
}

