//
//  ViewController.swift
//  TestVoiceCall
//
//  Created by ahmed gado on 9/20/20.
//  Copyright © 2020 ahmed gado. All rights reserved.
//

import UIKit
import JitsiMeet

class ViewController: UIViewController {

    @IBOutlet weak var callButton: UIButton!
    
    fileprivate var jitsiMeetView: JitsiMeetView?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    fileprivate func cleanUp() {
        if(jitsiMeetView != nil) {
            dismiss(animated: true, completion: nil)
            jitsiMeetView = nil
        }
    }
    @IBAction func callButtonPressed(_ sender: Any) {
        let room: String = "Gado"
              if(room.count < 1) {
                  return
              }
              
              // create and configure jitsimeet view
              let jitsiMeetView = JitsiMeetView()
              jitsiMeetView.delegate = self
              self.jitsiMeetView = jitsiMeetView
              let options = JitsiMeetConferenceOptions.fromBuilder { (builder) in
                  builder.welcomePageEnabled = false
                  builder.room = room
              }
                      
              // setup view controller
              let vc = UIViewController()
              vc.modalPresentationStyle = .fullScreen
              vc.view = jitsiMeetView
              
              // join room and display jitsi-call
              jitsiMeetView.join(options)
              present(vc, animated: true, completion: nil)
    }
    
}

extension ViewController: JitsiMeetViewDelegate {
    func conferenceTerminated(_ data: [AnyHashable : Any]!) {
        cleanUp()
    }
}
