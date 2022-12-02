//
//  AddVC.swift
//  DGDHKT
//
//  Created by 최시훈 on 2022/12/03.
//

import UIKit
import SnapKit
import Then
import Alamofire
import SwiftUI

class AddVC: UIViewController {
    @State var contenttitle: String = ""
    @State var content: String = ""
    @State var wrongtitle: Bool = false
    @State var wrongcontent: Bool = false
    @State var request: Bool = false
    @State var success: Bool = false
    
    let saveBt = UIButton().then {
        $0.setTitle("저장하기", for: .normal)
        $0.setTitleColor(UIColor(red: 10.0 / 255, green: 98.0 / 225, blue: 254.0 / 225, alpha: 1), for: .normal)
        $0.addTarget(self, action: #selector(DidTabSaveBt), for: .touchUpInside)
        
    }
    let titleTextField = UITextField().then {
        $0.placeholder = "제목을 입력해주세요"
        $0.font = .systemFont(ofSize: 14.0, weight: .medium)
        $0.textColor = .black
        $0.autocapitalizationType = .none
        $0.backgroundColor = UIColor(red: 255.0 / 255, green: 255.0 / 225, blue: 255.0 / 225, alpha: 1)
        $0.layer.cornerRadius = 20
    }
    let line = UIView().then {
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor(red: 96.0 / 255, green: 138.0 / 225, blue: 198.0 / 225, alpha: 1).cgColor
    }
    let contentTextField = UITextField().then {
        $0.placeholder = "내용을 입력해주세요"
        $0.font = .systemFont(ofSize: 14.0, weight: .medium)
        $0.textColor = .black
        $0.autocapitalizationType = .none
        $0.backgroundColor = UIColor(red: 255.0 / 255, green: 255.0 / 225, blue: 255.0 / 225, alpha: 1)
        $0.layer.cornerRadius = 20
    }
    let contentLine = UIView().then {
        $0.layer.borderWidth = 2
        $0.layer.borderColor = UIColor(red: 96.0 / 255, green: 138.0 / 225, blue: 198.0 / 225, alpha: 1).cgColor
        $0.layer.cornerRadius = 20
    }
    @objc func DidTabSaveBt() {
        let title = titleTextField.text!
        let content = contentTextField.text!
        let name: String = "최시훈"
        print( title, content, name)
        let param: Parameters = [
            "userName": name,
            "title": title,
            "content": content
        ]
        AF.request("\(api)/post",
                   method: .post,
                   parameters: param,
                   encoding : JSONEncoding.default,
                   headers: ["Content-Type": "application/json"]
        )
        .responseData(emptyResponseCodes: [201]) { res in
            switch res.result {
            case .success(_):
                let VC = TabBarcontroller()
                VC.modalPresentationStyle = .fullScreen
                self.present(VC, animated: true, completion: nil)
            case let .failure(err):
                print("🚫",err.localizedDescription)
            }
        }
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setup()
    }
    func setup() {
        [
            saveBt ,titleTextField, line, contentLine, contentTextField
        ].forEach{ self.view.addSubview($0)
        }
        saveBt.snp.makeConstraints {
            $0.top.equalToSuperview().offset(30)
            $0.bottom.equalToSuperview().offset(-750)
            $0.left.equalToSuperview().offset(300)
            $0.right.equalToSuperview().offset(-10)
        }
        titleTextField.snp.makeConstraints {
            $0.top.equalToSuperview().offset(150)
            $0.bottom.equalToSuperview().offset(-600)
            $0.left.equalToSuperview().offset(70)
            $0.right.equalToSuperview().offset(-70)
        }
        line.snp.makeConstraints {
            $0.top.equalTo(titleTextField.snp.bottom).offset(0)
            $0.bottom.equalTo(titleTextField.snp.bottom).offset(1)
            $0.left.equalToSuperview().offset(70)
            $0.right.equalToSuperview().offset(-70)
        }
        contentTextField.snp.makeConstraints {
            $0.top.equalTo(titleTextField.snp.bottom).offset(40)
            $0.bottom.equalToSuperview().offset(-500)
            $0.left.equalToSuperview().offset(70)
            $0.right.equalToSuperview().offset(-70)
        }
        contentLine.snp.makeConstraints {
            $0.top.equalTo(contentTextField.snp.top).offset(-20)
            $0.bottom.equalToSuperview().offset(-50)
            $0.left.equalToSuperview().offset(60)
            $0.right.equalToSuperview().offset(-60)
        }
    }
}

