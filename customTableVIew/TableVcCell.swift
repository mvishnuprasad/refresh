//
//  TableVcCell.swift
//  customTableVIew
//
//

import UIKit

class TableVcCell: UITableViewCell {
    var titleView = UILabel()
    var tableImageView = UIImageView()
    weak var delegate: CustomCellDelegate?

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(titleView)
        addSubview(tableImageView)
        configureCellImgVIew()
        configureCellVIew()
        setImageConstraints()
        setTitleLabelConstraints()
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
    
}


protocol CustomCellDelegate: AnyObject {
    func didTapButton(in cell: TableVcCell)
}
