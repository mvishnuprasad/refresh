//
//  ViewController.swift
//  customTableVIew
//
 
//

import UIKit

class SecondViewController: UIViewController {
    @IBOutlet weak var countLabel: UILabel!
    var labelText: String?
    override func viewDidLoad() {
        super.viewDidLoad()
        countLabel.text=labelText ?? ""
        view.addSubview(countLabel)
    }


}

