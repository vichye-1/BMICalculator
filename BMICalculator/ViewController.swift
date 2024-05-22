//
//  ViewController.swift
//  BMICalculator
//
//  Created by 양승혜 on 5/21/24.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var BoldLabel: UILabel!
    @IBOutlet var regularLabel: UILabel!
    @IBOutlet var imageView: UIImageView!
    
    @IBOutlet var nickNameLabel: UILabel!
    @IBOutlet var nickNameView: UIView!
    @IBOutlet var nickNameTextField: UITextField!
    
    @IBOutlet var heightLabel: UILabel!
    @IBOutlet var heightView: UIView!
    @IBOutlet var heightTextField: UITextField!
    
    @IBOutlet var weightLabel: UILabel!
    @IBOutlet var weightView: UIView!
    @IBOutlet var weightTextField: UITextField!
    
    @IBOutlet var privateButton: UIButton!
    
    @IBOutlet var randomButton: UIButton!
    @IBOutlet var resultButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        boldLabelUI()
        regularLabelUI()
        configureNickNameLabel()
        configureWeightLabel()
        configureNickNameView()
        configureHeightView()
        configureWeightView()
        configureNickNameTextField()
        configureHeightTextField()
        configureWeightTextField()
        privateButtonUI()
        configureRandomButton()
        configureResultButton()
        
    }
    
    @IBAction func regularKeyboardDismiss(_ sender: UITextField) {
    }
    
    @IBAction func returnButtonClicked(_ sender: UIButton) {
        guard let height = heightTextField.text,
              let weight = weightTextField.text else {
            alertError()
            return
        }
        
        guard height.count < 4 && height.count > 1, weight.count < 4 && weight.count > 1 else {
            alertError()
            return
        }
        
        alertBMI()
        
        UserDefaults.standard.set(nickNameTextField.text, forKey: "nickname")
        UserDefaults.standard.set(heightTextField.text, forKey: "userHeight")
        UserDefaults.standard.set(weightTextField.text, forKey: "userWeight")
    }
    
    @IBAction func keyboadDismiss(_ sender: UITapGestureRecognizer) {
        view.isUserInteractionEnabled = true
        view.endEditing(true)
    }
    
    @IBAction func randomButtonTapped(_ sender: UIButton) {
        let randomWeight = Int.random(in: 10...200)
        let randomHeight = Int.random(in: 110...250)
        nickNameTextField.text = String(randomHeight)
        heightTextField.text = String(randomWeight)
    }
    
    private func boldLabelUI() {
        BoldLabel.text = "BMI Calculator"
        BoldLabel.textAlignment = .left
        BoldLabel.font = UIFont.boldSystemFont(ofSize: 25)
    }
    
    private func regularLabelUI() {
        regularLabel.text = "당신의 BMI 지수를\n알려드릴게요."
        regularLabel.numberOfLines = 2
        regularLabel.textAlignment = .left
        regularLabel.font = UIFont.systemFont(ofSize: 18)
    }
    
    private func configureNickNameLabel() {
        nickNameLabel.text = "닉네임이 어떻게 되시나요?"
        nickNameLabel.textAlignment = .left
        nickNameLabel.sizeToFit()
        nickNameLabel.numberOfLines = 1
    }
    
    private func configureHeightLabel() {
        heightLabel.text = "키가 어떻게 되시나요?"
        heightLabel.textAlignment = .left
    }
    
    private func configureWeightLabel() {
        weightLabel.text = "몸무게는 어떻게 되시나요?"
        weightLabel.textAlignment = .left
    }
    
    private func configureNickNameView() {
        nickNameView.layer.borderWidth = 2
        nickNameView.layer.cornerRadius = 20
    }
    
    private func configureHeightView() {
        heightView.layer.borderWidth = 2
        heightView.layer.cornerRadius = 20
    }
    
    private func configureWeightView() {
        weightView.layer.borderWidth = 2
        weightView.layer.cornerRadius = 20
    }
    
    private func configureNickNameTextField() {
        let name = UserDefaults.standard.string(forKey: "nickname")
        nickNameTextField.text = name
        
        nickNameTextField.borderStyle = .none
        nickNameTextField.keyboardType = .default
        nickNameTextField.placeholder = "닉네임을 입력해주세요"
    }
    
    private func configureHeightTextField() {
        
        let height = UserDefaults.standard.string(forKey: "userHeight")
        heightTextField.text = height
        
        heightTextField.borderStyle = .none
        heightTextField.keyboardType = .numberPad
        heightTextField.placeholder = "키를 입력해주세요"
    }
    
    private func configureWeightTextField() {
        weightTextField.borderStyle = .none
        weightTextField.keyboardType = .numberPad
        weightTextField.isSecureTextEntry = true
        weightTextField.placeholder = "몸무게를 입력해주세요"
        let weight = UserDefaults.standard.string(forKey: "userWeight")
        weightTextField.text = weight
    }
    
    private func privateButtonUI() {
        privateButton.setImage(UIImage(systemName: "eye.slash"), for: .normal)
        privateButton.setImage(UIImage(systemName: "eye"), for: .highlighted)
        privateButton.tintColor = .lightGray
    }
    
    private func configureRandomButton() {
        randomButton.setTitle("랜덤으로 BMI 계산하기", for: .normal)
        randomButton.setTitleColor(.red, for: .normal)
        randomButton.contentHorizontalAlignment = .right
        randomButton.titleLabel?.font = UIFont.systemFont(ofSize: 13)
    }
    
    private func configureResultButton() {
        resultButton.setTitle("결과 확인", for: .normal)
        resultButton.setTitleColor(.white, for: .normal)
        resultButton.setTitleColor(.systemPink, for: .highlighted)
        resultButton.backgroundColor = .purple
        resultButton.layer.cornerRadius = 15
    }
    
    private func alertBMI() {
        let userWeight = heightTextField.text ?? ""
        let userHeight = weightTextField.text ?? ""
        
        if let doubleWeight = Double(userWeight), let doubleHeight = Double(userHeight) {
            let BMI = doubleWeight / pow((doubleHeight / 100), 2)
            let truncateBmi = String(format: "%.2f", BMI)
            let alert = UIAlertController(title: "BMI 지수 공개", message: "당신의 BMI 지수는 \(truncateBmi)입니다!", preferredStyle: .alert)
            let yes = UIAlertAction(title: "확인", style: .default)
            alert.addAction(yes)
            present(alert, animated: true)
        } else {
            let warning = UIAlertController(title: "숫자만 입력할 수 있습니다!", message: "다시 입력해주세요", preferredStyle: .alert)
            let no = UIAlertAction(title: "확인", style: .default)
            warning.addAction(no)
            present(warning, animated: true)
        }
    }
    
    private func alertError() {
        let alert = UIAlertController(title: "Error!", message: "정확한 값을 입력하세요", preferredStyle: .alert)
        let confirm = UIAlertAction(title: "확인", style: .default)
        alert.addAction(confirm)
        present(alert, animated: true)
    }
    
    private func resultButtonClicked() {
        
    }
}


