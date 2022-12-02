//
//  HomeVC.swift
//  DGDHKT
//
//  Created by 최시훈 on 2022/12/02.
//

import UIKit
import SnapKit
import Then

class HomeVC: UIViewController {
    
    
    
    private func setupNavigationBar() {
        let navigationBarAppearance = UINavigationBarAppearance()
        navigationBarAppearance.backgroundColor = UIColor.systemOrange
        navigationController?.navigationBar.standardAppearance = navigationBarAppearance
        navigationController?.navigationBar.scrollEdgeAppearance = navigationBarAppearance
    }
    private func setupNavigationBarItem() {
        let AddButton = UIBarButtonItem(
            image: UIImage(systemName: "plus"),
            style: .plain,
            target: self,
            action: #selector(DidTabMassageButton)
        )
        navigationItem.rightBarButtonItem = AddButton
    }
    
    
    @objc func DidTabMassageButton() {
        let VC = AddVC()
        self.present(VC, animated: true, completion: nil)
        
    }
    let name = UILabel().then {
        $0.text = "최시훈"
        $0.font = UIFont(name: "GangwonEduAll-OTFBold", size: 20)
    }
    let content = UILabel().then {
        $0.text = "애플스토어가서 할까요"
        $0.font = UIFont(name: "GangwonEduAll-OTFBold", size: 20)
    }
    let contenttitle = UILabel().then {
        $0.text = "ios 개발을 하고싶은데 맥북이 없어요"
        $0.font = UIFont(name: "GangwonEduAll-OTFBold", size: 20)
    }
    let line = UIView().then {
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor(red: 96.0 / 255, green: 138.0 / 225, blue: 198.0 / 225, alpha: 1).cgColor
        $0.layer.cornerRadius = 20
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.tintColor = .black
        setupNavigationBar()
        setupNavigationBarItem()
        setup()
    }
    func setup() {
        
        [line, name, contenttitle, content
        ].forEach{ self.view.addSubview($0) }
        line.snp.makeConstraints {
            $0.top.equalToSuperview().offset(200)
            $0.bottom.equalToSuperview().offset(-500)
            $0.left.equalToSuperview().offset(20)
            $0.right.equalToSuperview().offset(-20)
        }
        name.snp.makeConstraints {
            $0.top.equalToSuperview().offset(210)
            $0.bottom.equalToSuperview().offset(-610)
            $0.left.equalToSuperview().offset(20)
            $0.right.equalToSuperview().offset(-20)
        }
        contenttitle.snp.makeConstraints {
            $0.top.equalTo(name.snp.bottom).offset(0)
            $0.bottom.equalTo(name.snp.bottom).offset(20)
            $0.left.equalToSuperview().offset(20)
            $0.right.equalToSuperview().offset(-20)
        }
        content.snp.makeConstraints {
            $0.top.equalTo(contenttitle.snp.bottom).offset(20)
            $0.bottom.equalTo(contenttitle.snp.bottom).offset(40)
            $0.left.equalToSuperview().offset(20)
            $0.right.equalToSuperview().offset(-20)
        }
    }
}
