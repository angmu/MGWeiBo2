//
//  RedViewController.swift
//  MGWeiBo2
//
//  Created by MGBook on 2020/9/4.
//  Copyright © 2020 穆良. All rights reserved.
//

import UIKit

class RedViewController: UIViewController {

    let httpTool: HttpTool = HttpTool()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .gray
        navigationItem.title = "红色控制器"
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("-----\(#function)")
        print("-----\(self)")

//        weak var weakSelf = self //Optional
        httpTool.loadData { [weak self] (jsonData: String) in
            print("在HomeViewController中，请求到数据：\(jsonData)")
            self?.view.backgroundColor = .red
//            weakSelf?.view.backgroundColor = .red
        }
    }
    
    deinit {
        print("RedViewController --- deinit")
    }

}
