//
//  SecondViewController.swift
//  PassData_Notification
//
//  Created by Jes Yang on 2019/10/10.
//  Copyright © 2019 Jes Yang. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func redButtonTapped(_ sender: UIButton) {
        let name = Notification.Name(rawValue: redNotificationKey)
        NotificationCenter.default.post(name: name, object: nil)
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func greenButtonTapped(_ sender: UIButton) {
        let name = Notification.Name(rawValue: greenNotificationKey)
        NotificationCenter.default.post(name: name, object: nil)
        dismiss(animated: true, completion: nil)
    }

}
