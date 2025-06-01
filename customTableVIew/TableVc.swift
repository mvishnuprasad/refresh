//
//  TableVc.swift
//  customTableVIew
//
//

import UIKit

class TableVc: UIViewController {
    var tableView = UITableView()
    override func viewDidLoad() {
        super.viewDidLoad()

        configureTableView()
    }
    
    func configureTableView(){
        view.addSubview(tableView)
        setDelegate()
        tableView.rowHeight = 60
        tableView.register(TableVcCell.self, forCellReuseIdentifier: "customCell")
        tableView.pin(to:view)
    }
    func setDelegate(){
        tableView.delegate =  self
        tableView.dataSource = self
        
    }

}
extension TableVc : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fetchData().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "customCell") as! TableVcCell
        let tableRow = fetchData()[indexPath.row]
        cell.titleView.text = tableRow.title
        cell.tableImageView.image = tableRow.image
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let detailVC = storyboard.instantiateViewController(withIdentifier: "SecondViewController") as! SecondViewController
        let tableRow = fetchData()[indexPath.row]
        detailVC.labelText = tableRow.title  
        navigationController?.pushViewController(detailVC, animated: true)
        
    }
    
    func fetchData() -> [TableModel] {
        var data = [TableModel]()
        for  i in 0 ... 30{
            data.append(TableModel(image: UIImage(systemName: "\(i).circle" )!    , title: "Row \(i)"))
        }
                
            return data
    }
}
 

extension UIView {
    func pin(to superView: UIView) {
        translatesAutoresizingMaskIntoConstraints = false
        topAnchor.constraint(equalTo: superView.topAnchor).isActive = true
        leadingAnchor.constraint(equalTo: superView.leadingAnchor).isActive = true
        trailingAnchor.constraint(equalTo: superView.trailingAnchor).isActive = true
        bottomAnchor.constraint(equalTo: superView.bottomAnchor).isActive = true
    }
}
