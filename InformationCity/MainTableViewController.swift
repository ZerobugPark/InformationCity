//
//  MainTableViewController.swift
//  InformationCity
//
//  Created by youngkyun park on 1/4/25.
//

import UIKit
import Kingfisher


class MainTableViewController: UITableViewController {


    var travelInfo = TravelInfo()
    
    override func viewDidLoad() {
        super.viewDidLoad()

 
    }

    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        travelInfo.travel.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "MainTableViewController") as! MainTableViewCell
        
        let row = travelInfo.travel[indexPath.row]
        
        if row.ad {
            let cell = tableView.dequeueReusableCell(withIdentifier: "adView") as! AdTableViewCell
            
            cell.adTitleLabel.text = row.title
            cell.adTitleLabel.font = .boldSystemFont(ofSize: 14)
            cell.adTitleLabel.numberOfLines = 0
            cell.adTitleLabel.textAlignment = .center
            
            cell.adLabel.text = "AD"
            
            cell.adLabel.layer.cornerRadius = 10
            cell.adLabel.backgroundColor = .white
            cell.adLabel.textAlignment = .center
            cell.adLabel.clipsToBounds = true
            cell.adLabel.font = .systemFont(ofSize: 10)
            tableView.rowHeight = 80
            
            let colors: [UIColor] = [#colorLiteral(red: 1, green: 0.853197217, blue: 0.8475526571, alpha: 1), #colorLiteral(red: 0.8539611101, green: 1, blue: 0.8462869525, alpha: 1)]
            cell.bgView.backgroundColor = colors.randomElement()
            
            cell.bgView.layer.cornerRadius = 10
            cell.bgView.clipsToBounds = true
            
            return cell
        }
        
        cell.titleLabel.text = row.title
        cell.titleLabel.font = .boldSystemFont(ofSize: 16)
        
        
        
        cell.descriptionLabel.text = row.description
        cell.descriptionLabel.font = .systemFont(ofSize: 13)
        cell.descriptionLabel.numberOfLines = 0
        cell.descriptionLabel.textColor = .gray
        
        if let grade = row.grade {
            cell.grade.rating = grade
            if let save = row.save {
                cell.grade.text = "저장 \(save)"
            }
            // 터치 시 평점 변경 불가 (평점 입력 없이 별만 표시할 경우 사용)
            cell.grade.settings.updateOnTouch = false
            // 별 채우기 모드
            // full(완전히), half(반 씩), precise(클릭한 곳까지; 소수점 둘 째 자리까지 컨트롤)
            cell.grade.settings.fillMode = .precise
            
            // 별 크기
            cell.grade.settings.starSize = 15
            cell.grade.settings.textFont = .systemFont(ofSize: 12)
        }
    
        if let image = row.travel_image {
            let url = URL(string: image)
            cell.travelImage.kf.setImage(with: url)
            cell.travelImage.contentMode = .scaleAspectFill
            cell.travelImage.layer.cornerRadius = 10
            cell.travelImage.clipsToBounds = true
        }
        
        cell.likeButton.tintColor = .white
        
        cell.likeButton.tag = indexPath.row
        
        tableView.rowHeight = 160
        
        return cell
    }
    

 
}
