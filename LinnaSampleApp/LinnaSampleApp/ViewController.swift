//
//  ViewController.swift
//  LinnaSampleApp
//
//  Created by Suita Fujino on 2018/11/14.
//  Copyright © 2018 Suita Fujino. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        linna.out("viewDidLoad")
        linna.out("Hello!", level: .warning, tags: ["Hello"])
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        linna.out("viewWillAppear")
    }
    
    @IBAction func infoTapped(_ sender: Any) {
        linna.out("Info button tapped!", tags: ["Button"])
    }
    @IBAction func warnTapped(_ sender: Any) {
        linna.out("Warn button tapped!", level: .warning, tags: ["Button"])
    }
    @IBAction func errorTapped(_ sender: Any) {
        linna.out("Error button tapped!", level: .error, tags: ["Button"])
    }
    
}
