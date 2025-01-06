//
//  MainTableViewController.swift
//  InformationCity
//
//  Created by youngkyun park on 1/4/25.
//

import UIKit
import Kingfisher


class MainTableViewController: UITableViewController {

    @IBOutlet var mainTitle: UILabel!
    
    var travelInfo = TravelInfo().travel
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
 
        let title = "도시 상세 정보"
        mainTitle.text = title
        mainTitle.textAlignment = .center
        mainTitle.font = .boldSystemFont(ofSize: 16)
    }

    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        travelInfo.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: MainTableViewCell.identifier) as! MainTableViewCell
        
        let row = travelInfo[indexPath.row]
        
        if row.ad {
            let cell = tableView.dequeueReusableCell(withIdentifier: AdTableViewCell.identifier) as! AdTableViewCell
            
            cell.configureData(row: row)
            return cell
        }
        
        cell.configure(row: row)
       
        cell.likeButton.tag = indexPath.row
        cell.likeButton.addTarget(self, action: #selector(likeBtnTapped), for: .touchUpInside)
   
        
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if travelInfo[indexPath.row].ad {
            return 80
        } else {
            return 160
        }
    }
    
    @objc private func likeBtnTapped(_ sender: UIButton) {
        if travelInfo[sender.tag].like != nil {
            travelInfo[sender.tag].like?.toggle()
            tableView.reloadRows(at: [IndexPath(row: sender.tag, section: 0)], with: .none)
        }

        
    }
 
}
