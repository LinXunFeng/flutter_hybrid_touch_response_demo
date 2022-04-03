//
//  ViewController.swift
//  ProjectiOS
//
//  Created by LinXunFeng on 2022/4/3.
//

import UIKit
import Flutter

class ViewController: UIViewController {
    
    let jumpBtn = UIButton(type: .system)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.jumpBtn.setTitle("jump", for: .normal)
        self.jumpBtn.addTarget(self, action: #selector(handleJumpBtnClick), for: .touchUpInside)
        self.jumpBtn.frame = CGRect(x: 0, y: 300, width: self.view.bounds.width, height: 44)
        self.view.addSubview(self.jumpBtn)
    }

    func fetchFlutterEngine() -> FlutterEngine {
        return (UIApplication.shared.delegate as! AppDelegate).flutterEngine
    }
    
    @objc func handleJumpBtnClick() {
        let flutterVc = LXFFlutterViewController(engine: fetchFlutterEngine(), nibName: nil, bundle: nil)
        self.navigationController?.pushViewController(flutterVc, animated: true)
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + .seconds(1)) { [self] in
            
            let popView = LXFPopView(frame: CGRect(x: 0, y: 0, width: screenW, height: screenH))
            flutterVc.view.addSubview(popView)
//            self.navigationController?.view.addSubview(popView)
            popView.checkInfoBlock = { [weak self] in
                guard let self = self else { return }
                self.navigationController?.pushViewController(InfoViewController(), animated: true)
            }
            
        }
    }
}
