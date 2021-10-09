//
//  ViewController.swift
//  chyamadaKadai13
//
//  Created by 山田　天星 on 2021/09/28.
//

import UIKit

struct Fruit {
    var name: String
    var isChecked: Bool
}

final class ItemListViewController: UIViewController {
    @IBOutlet private weak var tableView: UITableView! {
        didSet {
            tableView.register(ItemListTableViewCell.nibName,
                               forCellReuseIdentifier: ItemListTableViewCell.nibID)
            tableView.delegate = self
            tableView.dataSource = self
        }
    }

    private var fruitsList: [Fruit] = [Fruit(name: "りんご", isChecked: false),
                                       Fruit(name: "みかん", isChecked: true),
                                       Fruit(name: "バナナ", isChecked: false),
                                       Fruit(name: "パイナップル", isChecked: true)
    ]
}

extension ItemListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat { 40 }
}

extension ItemListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        fruitsList.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ItemListTableViewCell.nibID, for: indexPath)
                as? ItemListTableViewCell else {
            fatalError("The dequeued cell is not instance")
        }

        let fruit = fruitsList[indexPath.row]
        cell.configure(fruit: fruit)
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // セルのタップ時にBool値を反転させる処理
        fruitsList[indexPath.row].isChecked.toggle()
        tableView.reloadData()
    }
}

extension ItemListViewController {
    @IBAction private func didTapCancelButton(segue: UIStoryboardSegue) { }

    @IBAction private func addItem(segue: UIStoryboardSegue) {
        guard let sourceViewController = segue.source as? AddItemViewController,
              let itemName = sourceViewController.itemName else {
            return
        }

        fruitsList.append(Fruit(name: itemName, isChecked: false))
        tableView.reloadData()
    }
}
