//
//  TableVcCell.swift
//  customTableVIew
//
//

import UIKit

class TableVcCell: UITableViewCell {
    var titleView = UILabel()
    var tableImageView = UIImageView()
    


    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(titleView)
        addSubview(tableImageView)
        addSubview(checkboxButton)
        configureCellImgVIew()
        configureCellVIew()
        setImageConstraints()
        setTitleLabelConstraints()
        setCheckboxConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func configureCellImgVIew(){
        tableImageView.layer.cornerRadius = 10
        
    }
    func configureCellVIew(){
        titleView.numberOfLines = 0
        
    }
    var checkboxButton: UIButton = {
            let button = UIButton(type: .custom)
            button.translatesAutoresizingMaskIntoConstraints = false
            // SF Symbols: empty box & checkmark box
            button.setImage(UIImage(systemName: "square"), for: .normal)
            button.setImage(UIImage(systemName: "checkmark.square.fill"), for: .selected)
            button.tintColor = .systemBlue
            return button
        }()
    func setImageConstraints() {
        tableImageView.translatesAutoresizingMaskIntoConstraints = false
        tableImageView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        tableImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12).isActive = true
        tableImageView.heightAnchor.constraint(equalToConstant: 40).isActive = true
        tableImageView.widthAnchor.constraint(equalTo: tableImageView.heightAnchor).isActive = true
    }

    func setTitleLabelConstraints() {
        titleView.translatesAutoresizingMaskIntoConstraints = false
        titleView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        titleView.leadingAnchor.constraint(equalTo: tableImageView.trailingAnchor, constant: 20).isActive = true
        titleView.heightAnchor.constraint(equalToConstant: 80).isActive = true
        titleView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12).isActive = true
    }
    func setCheckboxConstraints() {
         checkboxButton.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
         checkboxButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12).isActive = true
         checkboxButton.widthAnchor.constraint(equalToConstant: 30).isActive = true
         checkboxButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
     }
}


