//
//  AddItemViewController.swift
//  chyamadaKadai13
//
//  Created by toaster on 2021/10/05.
//

import UIKit

final class AddItemViewController: UIViewController {
    @IBOutlet weak var itemNameTextField: UITextField! {
        didSet {
            saveBarButtonItem.isEnabled = false
            itemNameTextField.addTarget(self, action: #selector(validateName), for: .editingChanged)
        }
    }

    @IBOutlet private weak var saveBarButtonItem: UIBarButtonItem!

    @objc private func validateName() {
        guard let itemNameString = itemNameTextField.text  else { return }

        if itemNameString
            .trimmingCharacters(in: .whitespacesAndNewlines)
            .isEmpty {
            saveBarButtonItem.isEnabled = false
            return
        }

        saveBarButtonItem.isEnabled = true
    }
}
