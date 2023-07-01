//
//  PrefecturesViewController.swift
//  miurakadai11
//
//  Created by 三浦貴文 on 2023/06/25.
//

import UIKit

protocol PrefecturesViewControllerDelegate: AnyObject {
    func didSelectPrefectures(_ prefecture: String)
}

class PrefecturesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    weak var delegate: PrefecturesViewControllerDelegate?
    
    private let prefectures = ["北海道", "青森県", "岩手県", "宮城県", "秋田県", "山形県", "福島県", "茨城県", "栃木県", "群馬県", "埼玉県", "千葉県", "東京都", "神奈川県", "新潟県", "富山県", "石川県", "福井県", "山梨県", "長野県", "岐阜県", "静岡県", "愛知県", "三重県", "滋賀県", "京都府", "大阪府", "兵庫県", "奈良県", "和歌山県", "鳥取県", "島根県", "岡山県", "広島県", "山口県", "徳島県", "香川県", "愛媛県", "高知県", "福岡県", "佐賀県", "長崎県", "熊本県", "大分県", "宮崎県", "鹿児島県", "沖縄県"]

    // 配列の数を取得
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        prefectures.count
    }

    // 都道府県名のセルを作成
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = prefectures[indexPath.row]
        return cell
    }

    // 都道府県名を選択した場合の処理
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedPrefecture = prefectures[indexPath.row]
        delegate?.didSelectPrefectures(selectedPrefecture)
        dismiss(animated: true, completion: nil)
    }
}
