//
//  ViewController.swift
//  DGDHKT
//
//  Created by 최시훈 on 2022/12/02.
//

import UIKit
import SnapKit
import Then

class ViewController: UIViewController {
    let serchBar = UISearchBar().then{
        $0.text = "검색"

        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setup()
    }
    func setup() {
        
        [serchBar
        ].forEach{ self.view.addSubview($0) }
        serchBar.snp.makeConstraints {
            $0.top.equalToSuperview().offset(-30)
            $0.bottom.equalToSuperview().offset(-500)
            $0.left.equalToSuperview().offset(20)
            $0.right.equalToSuperview().offset(-20)
        }
    }
}

