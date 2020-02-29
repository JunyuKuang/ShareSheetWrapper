//
//  ViewController.swift
//  ShareSheetWrapper
//
//  Created by Jonny Kuang on 2/29/20.
//  Copyright © 2020 Jonny Kuang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        present(ShareViewController(), animated: true)
    }
}

class ShareViewController: UIViewController {
    
    private var shareSheet: UIActivityViewController!
    let customView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = URL(string: "https://apple.com")!
        
        shareSheet = UIActivityViewController(activityItems: [url], applicationActivities: nil)
        
        addChild(shareSheet)
        shareSheet.view.frame = view.bounds
        shareSheet.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.addSubview(shareSheet.view)
        shareSheet.didMove(toParent: self)
        
        customView.backgroundColor = .systemBlue
        view.addSubview(customView)
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        let customViewHeight = view.bounds.height * 0.25
        let shareSheetHeight = view.bounds.height * 0.75
        
        customView.frame = CGRect(x: 0, y: 0, width: view.bounds.width, height: customViewHeight)
        shareSheet.view.frame = CGRect(x: 0, y: customViewHeight, width: view.bounds.width, height: shareSheetHeight)
    }
}
