//
//  AccountInformationViewController.swift
//  Database Systems Project
//
//  Created by Anna on 4/12/20.
//  Copyright © 2020 Anna Systaliuk. All rights reserved.
//

import UIKit

class AccountInfoCell: UITableViewCell{
    @IBOutlet weak var sectionInfoLabel: UILabel!
    @IBOutlet weak var userInfoLabel: UILabel!
    @IBOutlet weak var editLabel:UILabel!
}

class AccountInformationViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "infoCell") as? AccountInfoCell else {
            return UITableViewCell()
        }
        switch indexPath.row {
        case 0:
            cell.sectionInfoLabel.text = "First name:"
            cell.userInfoLabel.text = "Tim"
            cell.accessoryType = .none
        case 1:
            cell.sectionInfoLabel.text = "Last name:"
            cell.userInfoLabel.text = "Cook"
            cell.accessoryType = .none
        case 2:
            cell.sectionInfoLabel.text = "Phone Number"
            cell.userInfoLabel.text = "5432123452"
            cell.editLabel.text = "Change"
        case 3:
            cell.sectionInfoLabel.text = "Email:"
            cell.userInfoLabel.text = "tim.cook@apple.com"
            cell.editLabel.text = "Change"
        case 4:
            cell.sectionInfoLabel.text = "Password:"
            cell.userInfoLabel.text = "********"
            cell.editLabel.text = "Change"
        default:
            cell.sectionInfoLabel.text = "extra cell!"
        }
        cell.backgroundColor = UIColor.white
        
        
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 81
    }
    
    @IBOutlet weak var infoTable: UITableView!
    @IBOutlet weak var profileImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        infoTable.dataSource = self
        infoTable.delegate = self
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
