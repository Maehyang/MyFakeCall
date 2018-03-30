//
//  SendingCallViewController.swift
//  MyFakeCall
//
//  Created by Maehyang Lee on 2018. 3. 29..
//  Copyright © 2018년 Maehyang Lee. All rights reserved.
//

import UIKit
import ChameleonFramework


class SendingCallViewController: UIViewController {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var onConnectLabel: UILabel!
    @IBOutlet weak var rejectButtonImage: UIButton!
    
    var preName = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameLabel.text = preName
    }
    
    
    
    
    
    //MARK: - Reject Button Pressed Methods
    
    @IBAction func rejectButtonPressed(_ sender: UIButton) {
        //전체화면 grayscale로 바꾸기
        onConnectLabel.text = "통화 종료 중..."
        
        UIView.animate(withDuration: 1, delay: 3, options: UIViewAnimationOptions.curveEaseOut, animations: {
            let transition:CATransition = CATransition()
            transition.duration = 0.8
            transition.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseOut)
            transition.type = kCATransitionFade
            
            // 키패드 같은것도 트랜지션에 들어가야해
            self.onConnectLabel.layer.add(transition, forKey: nil)
            self.rejectButtonImage.layer.add(transition, forKey: nil)
            self.view.window?.layer.add(transition, forKey: nil)
            self.dismiss(animated: true, completion: nil)
        }, completion: nil)
    }

    
}
