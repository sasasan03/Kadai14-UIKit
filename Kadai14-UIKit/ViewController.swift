//
//  ViewController.swift
//  Kadai14-UIKit
//
//  Created by sako0602 on 2023/06/21.
//

import UIKit

protocol ReusableCell {}

extension UITableView {
    func register(cellType: ReusableCell.Type){
        let className = String(describing: type(of: cellType.self))
        let nib = UINib(nibName: className, bundle: nil)
        register(nib, forCellReuseIdentifier: className)
    }
}

class ViewController: UIViewController {
    //差し替え不可
    var mainViewModel = MainViewModel.shared
    
    @IBOutlet weak var tabelView: UITableView!
    
    //MARK: - セグエ
    @IBAction func exit(segue: UIStoryboardSegue) {
    }
    
    @IBAction func exitAddition(segue: UIStoryboardSegue) {
        guard let nextVC = segue.source as? ItemAddViewController,
              let addItem = nextVC.addItem.text else { return print("値なし") }
        mainViewModel.listitems.append(ListItem(ischecked: false, name: addItem))
        tabelView.reloadData()
    }
    //MARK: - MainStoryboardの情報を登録。
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

// MARK: - ViewControlerにUITableViewDelegateとUITableViewDataSourceを適合させる

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    //リストに表示されるカウントを取得
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        mainViewModel.listitems.count
    }
    
    //リストのセルを作成。configure・・設定するという意味の方が相応しい。con（一緒）figure（形）語源を調べる。
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ListTableViewCell", for: indexPath) as! ListTableViewCell
        //ListTableViewCellのcreateCellメソッドで細かなセルを作成
        cell.configure(text: mainViewModel.listitems[indexPath.row].name, indexPath: indexPath)
        return cell
    }
    
    //セルがタップされた時の処理を記述
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.mainViewModel.listitems[indexPath.row].ischecked.toggle()
        tabelView.reloadRows(at: [indexPath], with: .automatic)
    }
}

