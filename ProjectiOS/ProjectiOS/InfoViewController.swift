//
//  InfoViewController.swift
//  ProjectiOS
//
//  Created by LinXunFeng on 2022/4/3.
//

import Foundation
import UIKit

class InfoViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        
        let label = UILabel()
        label.text = "https://github.com/LinXunFeng\n\n欢迎关注公众号：FSA全栈行动\n\n博客：https://fullstackaction.com"
        label.numberOfLines = 0
        label.textColor = .black
        label.frame = CGRect(x: 20, y: 200, width: 375, height: 0)
        label.sizeToFit()
        self.view.addSubview(label)
    }
}
