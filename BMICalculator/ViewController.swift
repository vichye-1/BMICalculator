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
    
    @IBOutlet var heightLabel: UILabel!
    @IBOutlet var heightView: UIView!
    @IBOutlet var heightTextField: UITextField!
    @IBOutlet var weightLabel: UILabel!
    @IBOutlet var weightView: UIView!
    @IBOutlet var weightTextField: UITextField!
    
    @IBOutlet var privateButton: UIImageView!
    @IBOutlet var randomButton: UIButton!
    @IBOutlet var resultButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        boldLabelUI()
        regularLabelUI()
        configureHeightLabel()
        configureWeightLabel()
        configureHeightView()
        configureWeightView()
        configureHeightTextField()
        configureWeightTextField()
        privateButtonUI()
        configureRandomButton()
        configureResultButton()
    }
    
    @IBAction func returnButtonClicked(_ sender: UIButton) {
        alertBMI()
    }
    
    @IBAction func keyboadDismiss(_ sender: UITapGestureRecognizer) {
        view.isUserInteractionEnabled = true
        view.endEditing(true)
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
    
    private func configureHeightLabel() {
        heightLabel.text = "키가 어떻게 되시나요?"
        heightLabel.textAlignment = .left
    }
    
    private func configureWeightLabel() {
        weightLabel.text = "몸무게는 어떻게 되시나요?"
        weightLabel.textAlignment = .left
    }
    
    private func configureHeightView() {
        heightView.layer.borderWidth = 2
        heightView.layer.cornerRadius = 20
    }
    
    private func configureWeightView() {
        weightView.layer.borderWidth = 2
        weightView.layer.cornerRadius = 20
    }
    
    private func configureHeightTextField() {
        heightTextField.borderStyle = .none
        heightTextField.keyboardType = .numberPad
    }
    
    private func configureWeightTextField() {
        weightTextField.borderStyle = .none
        weightTextField.keyboardType = .numberPad
    }
    
    private func privateButtonUI() {
        privateButton.image = UIImage(systemName: "eye.slash")
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
        let userWeight = weightTextField.text ?? ""
        let userHeight = heightTextField.text ?? ""
        
        if let doubleWeight = Double(userWeight), let doubleHeight = Double(userHeight) {
            let BMI = doubleWeight / pow(doubleHeight, 2)
            let alert = UIAlertController(title: "BMI 지수 공개!", message: "당신의 BMI 지수는 \(BMI)입니다!", preferredStyle: .alert)
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
}
