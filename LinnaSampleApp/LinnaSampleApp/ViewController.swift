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
        linna.cout("aaa")
        linna.setFileOutputPath(to: "tmp/hogetaro")
        linna.out("Hello!")
    }

}
