//
//  ViewController.swift
//  Kadai14-UIKit
//
//  Created by sako0602 on 2023/06/21.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var tabelView: UITableView!
    var mainViewModel = MainViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        let nib = UINib(nibName: "ListTableViewCell", bundle: nil)
        tabelView.register(nib, forCellReuseIdentifier: "ListTableViewCell")
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        mainViewModel.listitems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ListTableViewCell", for: indexPath) as! ListTableViewCell
        cell.createCell(text: mainViewModel.listitems[indexPath.row].name, indexPath: indexPath)
        return cell
    }
}

