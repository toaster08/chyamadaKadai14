//
//  AddItemViewController.swift
//  chyamadaKadai13
//
//  Created by toaster on 2021/10/05.
//

import UIKit

final class AddItemViewController: UIViewController {
    private(set) var itemName: String?

    @IBOutlet private weak var itemNameTextField: UITextField! {
        didSet {
            saveBarButtonItem.isEnabled = false
            itemNameTextField.addTarget(self, action: #selector(itemNameTextFieldEditingChanged), for: .editingChanged)
        }
    }

    @IBOutlet private weak var saveBarButtonItem: UIBarButtonItem!

    @objc private func itemNameTextFieldEditingChanged() {
        saveBarButtonItem.isEnabled = isValid(itemName: itemNameTextField.text ?? "")
        itemName = itemNameTextField.text
    }

    private func isValid(itemName: String) -> Bool {
        !itemName
            .trimmingCharacters(in: .whitespacesAndNewlines)
            .isEmpty
    }
}
