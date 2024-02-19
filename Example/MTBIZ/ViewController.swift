//
//  ViewController.swift
//  MTBIZ
//
//  Created by Hippie Fox on 02/19/2024.
//  Copyright (c) 2024 Hippie Fox. All rights reserved.
//

import UIKit
import SwiftyJSON
import MTBIZ

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        var arr: [String] = ["abc","labi.mp4","ajj.ddd.avi"]
        arr.forEach {
           
            print(($0 as NSString).deletingPathExtension,($0 as NSString).pathExtension)
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

