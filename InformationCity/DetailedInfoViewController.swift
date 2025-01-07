//
//  DetailedInfoViewController.swift
//  InformationCity
//
//  Created by youngkyun park on 1/7/25.
//

import UIKit

struct Info {
    var title: String?
    var image: String?
    var subtitle: String?
    
}

class DetailedInfoViewController: UIViewController {

    var detailedInfo = Info()
    
    
    @IBOutlet var mainImageView: UIImageView!
    @IBOutlet var mainTitle: UILabel!
    @IBOutlet var subTitle: UILabel!
    @IBOutlet var mainButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupConfig()
        setupObject()
        
        let navigationTitle = "관광지 화면"
        navigationItem.title = navigationTitle
        
    }
    

    private func setupConfig() {
        
        mainImageView.layer.cornerRadius = 10
        mainImageView.clipsToBounds = true
        mainImageView.contentMode = .scaleAspectFill
        
        mainTitle.font = .boldSystemFont(ofSize: 24)
        mainTitle.textAlignment = .center
        
        subTitle.font = .systemFont(ofSize: 14)
        subTitle.textAlignment = .center
        subTitle.numberOfLines = 0
        
        mainButton.layer.cornerRadius = 15
        mainButton.clipsToBounds = true
        mainButton.backgroundColor = #colorLiteral(red: 0.5726199746, green: 0.709902823, blue: 0.8986672759, alpha: 1)
        

        let btnTitle = "다른 관광지 보러가기"
        mainButton.setTitle(btnTitle, for: .normal)
        mainButton.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        mainButton.setTitleColor(.white, for: .normal)
    }
    
    private func setupObject() {
        
        mainTitle.text = detailedInfo.title
        subTitle.text = detailedInfo.subtitle
        
        if let image = detailedInfo.image {
            let url = URL(string: image)
            mainImageView.kf.setImage(with: url)
        } else {
            mainImageView.image = UIImage(systemName: "heart")
        }
        
        
    }
    
    
    
    
    
    @IBAction func backBtnTapped(_ sender: UIButton) {
        
        
        navigationController?.popViewController(animated: true)
        
    }
    
}
