//
//  signup.swift
//  DGDHKT
//
//  Created by 최시훈 on 2022/12/02.
//

import UIKit
import SnapKit
import Then
import Alamofire
import SwiftUI

class signupVC: UIViewController {
    @State var name : String = ""
    @State var id: String = ""
    @State var pw: String = ""
    @State var wrongname: Bool = false
    @State var wrongId: Bool = false
    @State var wrongPw: Bool = false
    @State var request: Bool = false
    @State var success: Bool = false
    
    let logolb = UILabel().then {
        $0.text = "hello"
        $0.font = UIFont(name: "GangwonEduAll-OTFBold", size: 60)
        $0.textAlignment = .center //가운데 정렬
        
    }
    let namelb = UILabel().then {
        $0.font = UIFont(name: "GangwonEduAll-OTFBold", size: 20)
        $0.text = " NAME"
    }
    let nameTextField = UITextField().then {
        $0.placeholder = "이름을 입력해주세요"
        $0.font = .systemFont(ofSize: 14.0, weight: .medium)
        $0.autocapitalizationType = .none
        $0.backgroundColor = UIColor(red: 220/255, green: 220/225, blue: 220/225, alpha: 1)
        $0.layer.cornerRadius = 27
        
    }
    
    let idlb = UILabel().then {
        $0.font = UIFont(name: "GangwonEduAll-OTFBold", size: 20)
        $0.text = " ID"
    }
    
    let idTextField = UITextField().then {
        $0.placeholder = "아이디를 입력해주세요"
        $0.font = .systemFont(ofSize: 14.0, weight: .medium)
        $0.autocapitalizationType = .none
        $0.backgroundColor = UIColor(red: 220/255, green: 220/225, blue: 220/225, alpha: 1)
        $0.layer.cornerRadius = 27
        
    }
    let pwlb = UILabel().then {
        $0.text = " PW"
        $0.font = UIFont(name: "GangwonEduAll-OTFBold", size: 20)
    }
    let pwTextField = UITextField().then {
        $0.placeholder = "비밀번호를 입력해주세요"
        $0.font = .systemFont(ofSize: 14.0, weight: .medium)
        $0.autocapitalizationType = .none
        $0.backgroundColor = UIColor(red: 220/255, green: 220/225, blue: 220/225, alpha: 1)
        $0.layer.cornerRadius = 27
    }
    
    let pwCKTextField = UITextField().then {
        $0.placeholder = "비밀번호를 확인해주세요"
        $0.font = .systemFont(ofSize: 14.0, weight: .medium)
        $0.autocapitalizationType = .none
        $0.backgroundColor = UIColor(red: 220/255, green: 220/225, blue: 220/225, alpha: 1)
        $0.layer.cornerRadius = 27
    }
    let CKPwlb = UILabel().then {
        $0.text = " PWCheck"
        $0.font = UIFont(name: "GangwonEduAll-OTFBold", size: 20)
    }
    let signupBt = UIButton().then {
        $0.backgroundColor = UIColor(red: 0.0/255, green:0.0/255, blue:0.0/255, alpha: 1)
        $0.setTitle("로그인", for: .normal)
        $0.layer.cornerRadius = 27
        $0.addTarget(self, action: #selector(TabsignupBt), for: .touchUpInside)
        
    }
    @objc private func TabsignupBt() {
        let VC = SigninVC()
        VC.modalPresentationStyle = .fullScreen
        self.present(VC, animated: true, completion: nil)
//        let name = nameTextField.text!
//        let id = idTextField.text!
//        let pw = pwTextField.text!
//        let pwCK = pwCKTextField.text!
//
//        print(name, id, pw, pwCK)
//        AF.request("\(api)/auth/signup",
//                   method: .post,
//                   parameters: ["name": name,
//                                "id": id,
//                                "password": pw],
//                   encoding : JSONEncoding.default,
//                   headers: ["Content-Type": "application/json"]
//        )
//        .validate()
//        .responseData { response in
//            switch response.result {
//
//                case.success:
//                    let VC = SigninVC()
//                    VC.modalPresentationStyle = .fullScreen
//                    self.present(VC, animated: true, completion: nil)
//
//            case.failure(let error):
//                print("통신 오류!\nCode:\(error._code), Message: \(error.errorDescription!)")
//            }
//        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setup()
    }
    
    func setup() {
        
        [logolb, namelb, nameTextField, idlb, idTextField, pwTextField, pwlb, pwlb, CKPwlb, pwCKTextField, signupBt
        ].forEach{ self.view.addSubview($0) }
        logolb.snp.makeConstraints {
            $0.top.equalToSuperview().offset(50)
            $0.bottom.equalToSuperview().offset(-590)
            $0.left.equalToSuperview().offset(70)
            $0.right.equalToSuperview().offset(-70)
        }
        namelb.snp.makeConstraints {
            $0.top.equalTo(logolb.snp.bottom).offset(10)
            $0.bottom.equalTo(logolb.snp.bottom).offset(25)
            $0.left.equalToSuperview().offset(40)
            $0.right.equalToSuperview().offset(-40)
        }
        nameTextField.snp.makeConstraints {
            $0.top.equalTo(logolb.snp.bottom).offset(30)
            $0.bottom.equalTo(logolb.snp.bottom).offset(90)
            $0.left.equalToSuperview().offset(40)
            $0.right.equalToSuperview().offset(-40)
        }
        idlb.snp.makeConstraints {
            $0.top.equalTo(logolb.snp.bottom).offset(100)
            $0.bottom.equalTo(logolb).offset(115)
            $0.left.equalToSuperview().offset(40)
            $0.right.equalToSuperview().offset(-40)
        }
        idTextField.snp.makeConstraints {
            $0.top.equalTo(logolb.snp.bottom).offset(120)
            $0.bottom.equalTo(logolb.snp.bottom).offset(180)
            $0.left.equalToSuperview().offset(40)
            $0.right.equalToSuperview().offset(-40)
        }
        pwlb.snp.makeConstraints {
            $0.top.equalTo(logolb.snp.bottom).offset(190)
            $0.bottom.equalTo(logolb.snp.bottom).offset(205)
            $0.left.equalToSuperview().offset(40)
            $0.right.equalToSuperview().offset(-40)
        }
        pwTextField.snp.makeConstraints {
            $0.top.equalTo(logolb.snp.bottom).offset(210)
            $0.bottom.equalTo(logolb.snp.bottom).offset(270)
            $0.left.equalToSuperview().offset(40)
            $0.right.equalToSuperview().offset(-40)
        }
        CKPwlb.snp.makeConstraints {
            $0.top.equalTo(logolb.snp.bottom).offset(280)
            $0.bottom.equalTo(logolb.snp.bottom).offset(295)
            $0.left.equalToSuperview().offset(40)
            $0.right.equalToSuperview().offset(-40)
        }
        pwCKTextField.snp.makeConstraints {
            $0.top.equalTo(logolb.snp.bottom).offset(300)
            $0.bottom.equalTo(logolb.snp.bottom).offset(360)
            $0.left.equalToSuperview().offset(40)
            $0.right.equalToSuperview().offset(-40)
        }
        signupBt.snp.makeConstraints {
            $0.top.equalTo(logolb.snp.bottom).offset(385)
            $0.bottom.equalTo(logolb.snp.bottom).offset(450)
            $0.left.equalToSuperview().offset(40)
            $0.right.equalToSuperview().offset(-40)
        }
    } //Auto Layout
    
}

