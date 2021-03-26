//
//  MenuViewController.swift
//  SideBarMenu2
//
//  Created by Jorge Pinedo on 6/29/19.
//  Copyright © 2019 Jorge Pinedo. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    let title_arr = ["Home","About as","Rate Us","Share","Logout"]
    
    
    @IBOutlet weak var menu_tableview: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        menu_tableview.delegate = self
        menu_tableview.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return title_arr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "menu_cell") as! MenuTableViewCell
        cell.label_title.text = title_arr[indexPath.row]
        return cell
    }

}
