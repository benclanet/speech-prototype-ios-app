//
//  Speech.swift
//  speech_prototype
//
//  Created by Benjamin Clanet on 4/7/15.
//  Copyright (c) 2015 Benjamin Clanet. All rights reserved.
//

import Foundation

class Speech: ISpeech {
    
    class var sharedInstance: Speech {
        struct Static {
            static var instance: Speech?
            static var token: dispatch_once_t = 0
        }
        
        dispatch_once(&Static.token) {
            Static.instance = Speech()
        }
        
        return Static.instance!
    }
    
    
    func startListening() {
        
        
    }
    
    func stopListening() {
        
    }
}