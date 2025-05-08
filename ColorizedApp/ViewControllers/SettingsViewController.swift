//
//  ViewController.swift
//  ColorizedApp
//
//  Created by serj on 31.03.2025.
//

import UIKit

final class SettingsViewController: UIViewController {
    
    @IBOutlet weak var showColorView: UIView!
    
    // MARK: - UI Elements of redColor
    @IBOutlet weak var redColorLabel: UILabel!
    @IBOutlet weak var redColorSlider: UISlider!
    
    // MARK: - UI Elements of greenColor
    @IBOutlet weak var greenColorLabel: UILabel!
    @IBOutlet weak var greenColorSlider: UISlider!
   
    // MARK: - UI Elements of BlueColor
    @IBOutlet weak var blueColorLabel: UILabel!
    @IBOutlet weak var blueColorSlider: UISlider!
    
    var viewColor: UIColor!
    
    unowned var delegate: SettingsViewControllerDelegate!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showColorView.layer.cornerRadius = 15
        setColor()
        
        showColorView.backgroundColor = viewColor
        
        // MARK: - UI Elements change values
        redColorLabel.text = string(from: redColorSlider)
        greenColorLabel.text = string(from: greenColorSlider)
        blueColorLabel.text = string(from: blueColorSlider)
    }
    
    
    
    @IBAction func sliderAction(_ sender: UISlider) {
        setColor()
        
        switch sender {
        case redColorSlider:
            redColorLabel.text = string(from: redColorSlider)
        case greenColorSlider:
            greenColorLabel.text = string(from: greenColorSlider)
        default:
            blueColorLabel.text = string(from: blueColorSlider)
        }
    }
    
    @IBAction func doneButtonPressed() {
        delegate.setColor(showColorView.backgroundColor ?? .white)
        dismiss(animated: true)
        
    }
    private func setColor() {
        showColorView.backgroundColor = UIColor(
            red: redColorSlider.value.cgFloat(),
            green: greenColorSlider.value.cgFloat(),
            blue: blueColorSlider.value.cgFloat(),
            alpha: 1
        )
    }
    
    private func string(from slider: UISlider) -> String {
            String(format: "%.2f", slider.value)
        }
}

extension Float {
    func cgFloat() -> CGFloat {
        CGFloat(self)
    }
}

