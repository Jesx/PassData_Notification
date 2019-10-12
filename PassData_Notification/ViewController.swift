//
//  ViewController.swift
//  PassData_Notification
//
//  Created by Jes Yang on 2019/10/10.
//  Copyright © 2019 Jes Yang. All rights reserved.
//

import UIKit

// Notification Key should be unique
let redNotificationKey = "com.jes-yang.red"
let greenNotificationKey = "com.jes-yang.green"

class ViewController: UIViewController {

    @IBOutlet weak var textLabel: UILabel!
    
    let red = Notification.Name(rawValue: redNotificationKey)
    let green = Notification.Name(rawValue: greenNotificationKey)
    
    // Required for deinit the observer
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createObservers()
    }

    func createObservers() {
        // Red
        NotificationCenter.default.addObserver(self, selector: #selector(updateTextLabel(notification:)), name: red, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(updateBackground(notification:)), name: red, object: nil)
        
        // Green
        NotificationCenter.default.addObserver(self, selector: #selector(updateTextLabel(notification:)), name: green, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(updateBackground(notification:)), name: green, object: nil)
    }
    
    @objc func updateTextLabel(notification: NSNotification) {
        
        let isRed = notification.name == red
        let text = isRed ? "Red" : "Green"
        textLabel.text = text
        
    }
    
    @objc func updateBackground(notification: NSNotification) {
        
        let isRed = notification.name == red
        let color = isRed ? UIColor.red : UIColor.green
        view.backgroundColor = color
    }
    
    @IBAction func gotoNextPage(_ sender: UIButton) {
        let secondVC = storyboard?.instantiateViewController(withIdentifier: "SecondVC") as! SecondViewController
        present(secondVC, animated: true, completion: nil)
    }
}

