//
//  ViewController.swift
//  LinnaSampleApp
//
//  Created by Suita Fujino on 2018/11/14.
//  Copyright © 2018 Suita Fujino. All rights reserved.
//

import Linna
import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        Linna.cout("aaa")
        Linna.setFileOutputPath(to: "tmp/hogetaro")
        Linna.fout("Hello!")
    }

}
