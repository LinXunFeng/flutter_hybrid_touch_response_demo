//
//  LXFPopView.swift
//  ProjectiOS
//
//  Created by LinXunFeng on 2022/4/3.
//

import UIKit

class LXFPopView: UIView, LXFFlutterForbidResponseProtocol {
    
    var checkInfoBlock: (() -> Void)?
    
    fileprivate let bgView = UIView()
    
    fileprivate let contentView = UIView()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.initUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    deinit {
        print("deinit")
    }
}

extension LXFPopView {
    fileprivate func initUI() {
        self.addSubview(self.bgView)
        self.bgView.addSubview(self.contentView)
        
        self.bgView.frame = CGRect(x: 0, y: 0, width: screenW, height: screenH)
        self.bgView.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        
        let contentViewW: CGFloat = 200
        let contentViewH: CGFloat = 200
        let contentViewX: CGFloat = (screenW - contentViewW) * 0.5
        let contentViewY: CGFloat = (screenH - contentViewH) * 0.5
        self.contentView.frame = CGRect(x: contentViewX, y: contentViewY, width: contentViewW, height: contentViewH)
        self.contentView.backgroundColor = .white
        
        let textField = UITextField(frame: CGRect(x: 0, y: 10, width: 150, height: 30))
        textField.placeholder = "测试输入"
        textField.backgroundColor = .white
        self.contentView.addSubview(textField)
        
        let checkInfoBtn = UIButton(type: .custom)
        self.contentView.addSubview(checkInfoBtn)
        checkInfoBtn.frame = CGRect(x: 10, y: 80, width: contentViewW - 20, height: 44)
        checkInfoBtn.backgroundColor = .blue.withAlphaComponent(0.7)
        checkInfoBtn.layer.cornerRadius = 4
        checkInfoBtn.setTitle("check the info", for: .normal)
        checkInfoBtn.addTarget(self, action: #selector(handleCheckInfoBtnClick), for: .touchUpInside)
        
        let closeBtn = UIButton(type: .custom)
        self.contentView.addSubview(closeBtn)
        closeBtn.frame = CGRect(x: 10, y: 140, width: contentViewW - 20, height: 44)
        closeBtn.backgroundColor = .red
        closeBtn.layer.cornerRadius = 4
        closeBtn.setTitle("close", for: .normal)
        closeBtn.addTarget(self, action: #selector(handleCloseBtnClick), for: .touchUpInside)
        
    }
}

extension LXFPopView {
    @objc func handleCloseBtnClick() {
        self.removeFromSuperview()
    }
    
    @objc func handleCheckInfoBtnClick() {
        self.checkInfoBlock?()
    }
}
