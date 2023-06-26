//
//  ViewController.swift
//  Kadai14-UIKit
//
//  Created by sako0602 on 2023/06/21.
//

import UIKit

class ViewController: UIViewController {
    
    var mainViewModel = MainViewModel.shared
    
    @IBOutlet weak var tabelView: UITableView!
    
    @IBAction func exit(segue: UIStoryboardSegue) {
    }
    
    @IBAction func exitAddition(segue: UIStoryboardSegue) {
        guard let nextVC = segue.source as? ItemAddViewController,
              let addItem = nextVC.addItem.text else { return print("値なし") }
        mainViewModel.listitems.append(ListItem(ischecked: false, name: addItem))
        tabelView.reloadData()
    }
    
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
        //カスタムセルを制作
        cell.createCell(text: mainViewModel.listitems[indexPath.row].name, indexPath: indexPath)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.mainViewModel.listitems[indexPath.row].ischecked.toggle()
        tabelView.reloadRows(at: [indexPath], with: .automatic)
    }
}

