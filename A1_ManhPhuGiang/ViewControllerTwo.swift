//
//  ViewControllerTwo.swift
//  A1_ManhPhuGiang
//
//  Created by ManhPhu Giang on 2025-02-17.
//

import Foundation
import UIKit

class ViewControllerTwo: UIViewController {
    var stringText: String = ""
    
    @IBOutlet var textView: UITextView!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        textView.text = stringText
    }
}
