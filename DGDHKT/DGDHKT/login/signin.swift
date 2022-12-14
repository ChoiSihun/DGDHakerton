//
//  signin.swift
//  DGDHKT
//
//  Created by 최시훈 on 2022/12/02.
//

import UIKit
import SnapKit
import Then
import Alamofire
import SwiftUI

class SigninVC: UIViewController {
    @State var id: String = ""
    @State var pw: String = ""
    @State var wrongId: Bool = false
    @State var wrongPw: Bool = false
    @State var request: Bool = false
    @State var success: Bool = false
    
    let imageView: UIImageView = {
            let aImageView = UIImageView()
            aImageView.backgroundColor = .white
            //표시될 UIImage 객체 부여
            aImageView.image = UIImage(named: "asdf")
            aImageView.translatesAutoresizingMaskIntoConstraints = false
            return aImageView
        }()
    let idlb = UILabel().then {
        $0.font = UIFont(name: "GangwonEduAll-OTFBold", size: 20)
        $0.text = " ID"
        //$0.backgroundColor = UIColor(red: 220.0 / 255, green: 220.0 / 225, blue: 220.0 / 225, alpha: 0.3)
    }
    private lazy var idTextField = UITextField().then {
        $0.placeholder = "아이디를 입력해주세요"
        $0.font = .systemFont(ofSize: 14.0, weight: .medium)
        $0.autocapitalizationType = .none
        $0.backgroundColor = UIColor(red: 220.0 / 255, green: 220.0 / 225, blue: 220.0 / 225, alpha: 0.5)
        $0.layer.cornerRadius = 20
    }
    let pwlb = UILabel().then {
        $0.text = " PW"
        $0.font = UIFont(name: "GangwonEduAll-OTFBold", size: 20)
    }
    private lazy var pwTextField = UITextField().then {
        $0.placeholder = "비밀번호를 입력해주세요"
        $0.font = .systemFont(ofSize: 14.0, weight: .medium)
        $0.autocapitalizationType = .none
        $0.isSecureTextEntry = true
        $0.backgroundColor = UIColor(red: 239.0/255, green: 239.0/225, blue: 239.0/225, alpha: 1)
        $0.layer.cornerRadius = 20
    }
    let signinBt = UIButton().then {
        $0.backgroundColor = UIColor(red: 0.0/255, green:0.0/255, blue:0.0/255, alpha: 1)
        $0.setTitle("로그인", for: .normal)
        $0.layer.cornerRadius = 20
        $0.addTarget(self, action: #selector(DidTabsigninBt), for: .touchUpInside)
    }
    let signupBt = UIButton().then {
        $0.setTitleColor(.black, for: .normal)
        $0.titleLabel?.font = UIFont.systemFont(ofSize: 10)
        $0.setTitle("회원이 아니신가요? 회원가입", for: .normal)
        $0.addTarget(self, action: #selector(DidTapSignupBt), for: .touchUpInside)
    }
    
    @objc func DidTabsigninBt() {
        let id = idTextField.text!
        let pw = pwTextField.text!
        print(id, pw)
        AF.request("\(api)/auth/signin",
                   method: .post,
                   parameters: ["id": id,
                                "password": pw],
                   encoding : JSONEncoding.default,
                   headers: ["Content-Type": "application/json"]
        )
        .validate()
        .responseData { response in
            switch response.result {
            case.success:
                let VC = TabBarcontroller()
                VC.modalPresentationStyle = .fullScreen
                self.present(VC, animated: true, completion: nil)
            case.failure(let error):
                print("통신 오류!\nCode:\(error._code), Message: \(error.errorDescription!)")
            }
        }
    }
    @objc func DidTapSignupBt() {
        let VC = signupVC()
        present(VC, animated: true, completion: nil)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setup()
        
    }
    
    func setup() {
        [
            imageView, idlb, idTextField, pwTextField, pwlb, pwTextField, signinBt, signupBt
        ].forEach{ self.view.addSubview($0)
        }
        imageView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(150)
            $0.bottom.equalToSuperview().offset(-600)
            $0.left.equalToSuperview().offset(70)
            $0.right.equalToSuperview().offset(-70)
        }
        idlb.snp.makeConstraints {
            $0.top.equalTo(idTextField).offset(-25)
            $0.bottom.equalTo(idTextField).offset(-50)
            $0.left.equalToSuperview().offset(70)
            $0.right.equalToSuperview().offset(-70)
        }
        idTextField.snp.makeConstraints {
            $0.top.equalTo(imageView).offset(150)
            $0.bottom.equalTo(imageView).offset(100)
            $0.left.equalToSuperview().offset(70)
            $0.right.equalToSuperview().offset(-70)
        }
        pwlb.snp.makeConstraints {
            $0.top.equalTo(pwTextField).offset(-25)
            $0.bottom.equalTo(pwTextField).offset(-50)
            $0.left.equalToSuperview().offset(70)
            $0.right.equalToSuperview().offset(-70)
        }
        pwTextField.snp.makeConstraints {
            $0.top.equalTo(imageView).offset(250)
            $0.bottom.equalTo(imageView).offset(200)
            $0.left.equalToSuperview().offset(70)
            $0.right.equalToSuperview().offset(-70)
        }
        signinBt.snp.makeConstraints {
            $0.top.equalTo(imageView).offset(350)
            $0.bottom.equalTo(imageView).offset(300)
            $0.left.equalToSuperview().offset(70)
            $0.right.equalToSuperview().offset(-70)
        }
        signupBt.snp.makeConstraints {
            $0.top.equalTo(signinBt.snp.bottom).offset(10)
            $0.bottom.equalToSuperview().offset(-280)
            $0.left.equalToSuperview().offset(200)
            $0.right.equalToSuperview().offset(-70)
        }
    }
}
