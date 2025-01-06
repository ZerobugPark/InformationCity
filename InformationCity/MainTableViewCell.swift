//
//  MainTableViewCell.swift
//  InformationCity
//
//  Created by youngkyun park on 1/4/25.
//

import UIKit
import Cosmos

class MainTableViewCell: UITableViewCell {

    static let identifier = "MainTableViewController"
    
    @IBOutlet var titleLabel: UILabel!
  
    @IBOutlet var descriptionLabel: UILabel!
    @IBOutlet var starGrade: CosmosView!
    @IBOutlet var likeButton: UIButton!
 
    @IBOutlet var travelImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setup()
    }
    
    private func setup() {
        
        titleLabel.font = .boldSystemFont(ofSize: 16)
        descriptionLabel.font = .systemFont(ofSize: 13)
        descriptionLabel.numberOfLines = 0
        descriptionLabel.textColor = .gray
        
        // 터치 시 평점 변경 불가 (평점 입력 없이 별만 표시할 경우 사용)
        starGrade.settings.updateOnTouch = false
        
        // 별 채우기 모드
        // full(완전히), half(반 씩), precise(클릭한 곳까지 소수점 둘 째 자리까지)
        starGrade.settings.fillMode = .precise
        
        // 별 크기
        starGrade.settings.starSize = 15
        starGrade.settings.textFont = .systemFont(ofSize: 12)
        
        travelImage.contentMode = .scaleAspectFill
        travelImage.layer.cornerRadius = 10
        travelImage.clipsToBounds = true
        
        likeButton.tintColor = .white
        
    }
    
    override func prepareForReuse() {
       // print(#function)
        travelImage.image = nil
    }
    
    
    func configure(row: Travel) {
       
        titleLabel.text = row.title
        descriptionLabel.text = row.description

        
        if let grade = row.grade {
            starGrade.rating = grade
            if let save = row.save {
                let text = "저장 \(save)"
                starGrade.text = text
            }
        }
    
        if let image = row.travel_image {
            let url = URL(string: image)
            travelImage.kf.setImage(with: url)

        }
        
        if let like = row.like {
            let image = like ? "heart" : "heart.fill"
            likeButton.setImage(UIImage(systemName: image), for: .normal)
        }
    }
}
