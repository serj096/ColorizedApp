//
//  StartViewController.swift
//  ColorizedApp
//
//  Created by serj on 07.05.2025.
//

import UIKit

protocol SettingsViewControllerDelegate: AnyObject {
    func setColor(_ color: UIColor)
}

final class StartViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let settingsVC = segue.destination as? SettingsViewController
        settingsVC?.delegate = self
        settingsVC?.viewColor = view.backgroundColor
    }
    
}
extension StartViewController: SettingsViewControllerDelegate {
        func setColor(_ color: UIColor) {
            view.backgroundColor = color
        }
        }
