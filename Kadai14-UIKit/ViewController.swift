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
    
    //MARK: - セグエ
    @IBAction func exit(segue: UIStoryboardSegue) {
    }
    
    @IBAction func exitAddition(segue: UIStoryboardSegue) {
        guard let nextVC = segue.source as? ItemAddViewController,
              let addItem = nextVC.addItem.text else { return print("値なし") }
        mainViewModel.listitems.append(ListItem(ischecked: false, name: addItem))
        tabelView.reloadData()
    }
    //MARK: - Viewの描画情報を登録
    override func viewDidLoad() {
        super.viewDidLoad()
        //Storyboardの情報を登録する。
        let nib = UINib(nibName: "ListTableViewCell", bundle: nil)
        tabelView.register(nib, forCellReuseIdentifier: "ListTableViewCell")
    }
}

// MARK: - ViewControlerにDelegateとDataSourceを継承させる

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    //リストに表示されるカウントを取得
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        mainViewModel.listitems.count
    }
    
    //リストのセルを作成
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ListTableViewCell", for: indexPath) as! ListTableViewCell
        //ListTableViewCellのcreateCellメソッドで細かなセルを作成
        cell.createCell(text: mainViewModel.listitems[indexPath.row].name, indexPath: indexPath)
        return cell
    }
    
    //セルがタップされた時の処理を記述
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.mainViewModel.listitems[indexPath.row].ischecked.toggle()
        tabelView.reloadRows(at: [indexPath], with: .automatic)
    }
}

