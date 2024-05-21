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
    
    
    @IBOutlet var questionLabels: [UILabel]!
    
    @IBOutlet var heightLabel: UILabel!
    @IBOutlet var heightView: UIView!
    @IBOutlet var heightTextField: UITextField!
    @IBOutlet var weightLabel: UILabel!
    @IBOutlet var weightView: UIView!
    @IBOutlet var weightTextField: UITextField!
    @IBOutlet var randomButton: UIButton!
    @IBOutlet var resultButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        boldLabelUI()
        regularLabelUI()
        questionLabelUI()
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
    
    private func questionLabelUI() {
        heightLabel.text = "키가 어떻게 되시나요?"
        heightLabel.font = UIFont.systemFont(ofSize: 18)
        heightLabel.textAlignment = .left
    }
}

