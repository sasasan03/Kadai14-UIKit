//
//  ListTableViewCell.swift
//  Kadai14-UIKit
//
//  Created by sako0602 on 2023/06/21.
//

import UIKit

class ListTableViewCell: UITableViewCell, ReusableCell {
    static let nibName = "ListTableViewCell"
    //ここでidentifierをインスタンスかして使用する
    static let identifier = "ListTableViewCell"
    
    @IBOutlet weak var imge: UIImageView!
    @IBOutlet weak var Label: UILabel!
    //表示させたいリスト情報をインスタンス化。
    var mainViewModel = MainViewModel.shared

    //セルを作るためのメソッド　　メソッド名
    func configure(text: String, indexPath: IndexPath){
        self.Label.text = text
        self.imge.image  = UIImage(
            systemName: mainViewModel.listitems[indexPath.row].ischecked
            ? "checkmark.circle.fill"
            : "circle"
        )
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
