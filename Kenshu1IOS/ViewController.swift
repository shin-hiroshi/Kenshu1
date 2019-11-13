//
//  ViewController.swift
//  Kenshu1IOS
//
//  Created by 沈洋 on 2019/11/13.
//  Copyright © 2019 JFX. All rights reserved.
//

import UIKit
import Foundation

struct Item {
    var id: Int
    var name: String
}

class ViewController: UIViewController, UITableViewDataSource {
    var list = [
        Item(id: 1, name: "Shiro"),
        Item(id: 2, name: "Lina"),
        Item(id: 3, name: "Wakaba"),
        Item(id: 4, name: "Rin"),
    ]
    
    @IBOutlet weak var btnOrderById: UIButton!
    @IBOutlet weak var btnOrderByName: UIButton!
    @IBOutlet weak var listTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = ItemCell()
        let item = list[indexPath.row]
        cell.textLabel?.text = "\(String(item.id))  \(item.name)"
        cell.lblId?.text = String(item.id)
        cell.lblName?.text = item.name
        return cell
    }
    
    
    @IBAction func orderById(_ sender: Any) {
        list.sort(by: {$0.id < $1.id})
        listTable.reloadData()
    }
    
    
    @IBAction func orderByName(_ sender: Any) {
        list.sort(by: {$0.name < $1.name})
        listTable.reloadData()
    }
}
