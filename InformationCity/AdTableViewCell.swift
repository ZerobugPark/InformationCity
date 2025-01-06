//
//  AdTableViewCell.swift
//  InformationCity
//
//  Created by youngkyun park on 1/4/25.
//

import UIKit

class AdTableViewCell: UITableViewCell {


    static let identifier = "AdTableViewCell"
    @IBOutlet var adLabel: UILabel!
    
    @IBOutlet var adTitleLabel: UILabel!
    
    @IBOutlet var bgView: UIView!
    
    let colors: [UIColor] = [#colorLiteral(red: 1, green: 0.853197217, blue: 0.8475526571, alpha: 1), #colorLiteral(red: 0.8539611101, green: 1, blue: 0.8462869525, alpha: 1)]
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setup()
    }
    
    private func setup() {
        
        adTitleLabel.font = .boldSystemFont(ofSize: 14)
        adTitleLabel.numberOfLines = 0
        adTitleLabel.textAlignment = .center
        
        adLabel.text = "AD"
        adLabel.layer.cornerRadius = 5
        adLabel.backgroundColor = .white
        adLabel.textAlignment = .center
        adLabel.clipsToBounds = true
        adLabel.font = .systemFont(ofSize: 10)
     
        bgView.layer.cornerRadius = 10
        bgView.clipsToBounds = true
        
    }
    

    func configureData(row: Travel) {
       
        adTitleLabel.text = row.title
        bgView.backgroundColor = colors.randomElement()
   
    }
    
}
