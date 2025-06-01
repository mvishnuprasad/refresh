//
//  ViewController.swift
//  customTableVIew
//

//

import UIKit

class SecondViewController: UIViewController {
    @IBOutlet weak var countLabel: UILabel!
    weak var delegate: TableStatusDelegate?
    var buttonStatus : Bool = false
    
    var labelText: String?
    override func viewDidLoad() {
        super.viewDidLoad()
        countLabel.text=labelText ?? ""
        view.addSubview(countLabel)
    }
    @IBAction func backButtonTapped(sender : UIButton){
        buttonStatus.toggle()
        delegate?.setStatus(buttonStatus, index: Int(String(labelText?.last ?? "0")) ?? 0)
        navigationController?.popViewController(animated: true)
    }
    
}

