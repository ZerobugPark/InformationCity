//
//  ADViewController.swift
//  InformationCity
//
//  Created by youngkyun park on 1/7/25.
//

import UIKit

class ADViewController: UIViewController {

    
    @IBOutlet var adLabel: UILabel!
    
    static let identifier = "ADViewController"
    
    var text: String?
    override func viewDidLoad() {
        super.viewDidLoad()

        
        let image = UIImage(systemName: "multiply")
        let cancelBtn = UIBarButtonItem(image: image, style: .plain, target: self, action: #selector(backBtnTapped))
        
        navigationItem.leftBarButtonItem = cancelBtn
        navigationItem.title = "광고화면"
        
        
        adLabel.numberOfLines = 0
        adLabel.font = .boldSystemFont(ofSize: 16)
        adLabel.textAlignment = .center
        adLabel.text = text
        
    }
    
    
    @objc private func backBtnTapped(_ sender: UIBarButtonItem) {
        
        print(#function)
        dismiss(animated: true)
    }

    
    
    
   

}
