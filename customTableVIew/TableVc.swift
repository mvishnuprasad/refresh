//
//  TableVc.swift
//  customTableVIew
//
//

import UIKit

class TableVc: UIViewController, TableStatusDelegate {
    
    
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
    private var checkStatus : Bool = false
    private var rowNum : Int = 0
    
    func setStatus(_ value: Bool, index: Int) {
        checkStatus = value
        rowNum = index
        tableView.reloadData()
    }
    
}
extension TableVc : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fetchData().count
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "customCell") as! TableVcCell
        let tableRow = fetchData()[indexPath.row]
        cell.titleView.text = tableRow.title
        cell.tableImageView.image = tableRow.image
        if(indexPath.row == rowNum){
            cell.checkboxButton.isSelected = checkStatus
        }
        
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let detailVC = storyboard.instantiateViewController(withIdentifier: "SecondViewController") as! SecondViewController
        detailVC.delegate = self
        tableView.deselectRow(at: indexPath, animated: true)
        let tableRow = fetchData()[indexPath.row]
        detailVC.labelText = tableRow.title
        navigationController?.pushViewController(detailVC, animated: true)
     
    }
    
    func fetchData() -> [TableModel] {
        var data = [TableModel]()
        for  i in 0 ... 3{
            data.append(TableModel(image: UIImage(systemName: "\(i).circle" )!, title: "Row \(i)", status: checkStatus))
        }
        
        return data
    }
}



