//
//  LXFFlutterViewController.swift
//  ProjectiOS
//
//  Created by LinXunFeng on 2022/4/3.
//

import Foundation
import Flutter

protocol LXFFlutterForbidResponseProtocol { }

class LXFFlutterViewController: FlutterViewController {
    
    var loadingView: UIView?
    
    var isForbidResponseForFlutter = false
    
    deinit {
        print("deinit -- LXFFlutterViewController")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setFlutterViewDidRenderCallback {
            print("setFlutterViewDidRenderCallback")
            self.loadingView?.removeFromSuperview()
        }

        let loadingView = UIView()
        loadingView.frame = CGRect(x: 0, y: 0, width: screenW, height: screenH)
        loadingView.backgroundColor = .white
        let activityView = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.large)
        activityView.startAnimating()
        activityView.frame = loadingView.bounds
        loadingView.addSubview(activityView)
        self.loadingView = loadingView
        self.view.addSubview(loadingView)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if self.isForbidResponse() {
            self.isForbidResponseForFlutter = true
            return
        }
        print("touches began")
        super.touchesBegan(touches, with: event)
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if isForbidResponseForFlutter { return }
        print("touches move")
        super.touchesMoved(touches, with: event)
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        if isForbidResponseForFlutter {
            self.isForbidResponseForFlutter = false
            return
        }
        print("touches ended")
        super.touchesEnded(touches, with: event)
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        if self.isForbidResponse() {
            self.isForbidResponseForFlutter = false
            return
        }
        print("touches cacelled")
        super.touchesCancelled(touches, with: event)
    }
}


extension LXFFlutterViewController {
    func isForbidResponse() -> Bool {
        var subViews = self.view?.subviews ?? []
        subViews = subViews.reversed()
        
        for i in 0..<subViews.count {
            let subView = subViews[i]
            print("** subView -- \(subView)")
            if self.isHadForbidResponseView(view: subView) {
                return true
            }
        }
        return false
    }
    
    fileprivate func isHadForbidResponseView(view: UIView) -> Bool {
        if view is LXFFlutterForbidResponseProtocol {
            return true
        }
        let subViews = view.subviews
        for i in 0..<subViews.count {
            let subView = subViews[i]
            print("++ subView -- \(subView)")
            if self.isHadForbidResponseView(view: subView) {
                return true
            }
        }
        return false
    }
}

private var LXFTestkey: Void?

extension UIView {
    var lxf_test: String? {
        get {
            return objc_getAssociatedObject(self, &LXFTestkey) as? String
        }
        
        set {
            objc_setAssociatedObject(
                self,
                &LXFTestkey, newValue,
                .OBJC_ASSOCIATION_RETAIN_NONATOMIC
            )
        }
    }
}
