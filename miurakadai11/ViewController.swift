//
//  ViewController.swift
//  miurakadai11
//
//  Created by 三浦貴文 on 2023/06/25.
//

import UIKit

class ViewController: UIViewController, PrefecturesViewControllerDelegate {
    
    @IBOutlet private weak var textLabel: UILabel!
    
    // ラベルの初期表示を未選択とする
    override func viewDidLoad() {
        super.viewDidLoad()
        textLabel.text = "未選択"
    }
    
    // 画面遷移の準備
    @IBAction func selectButton(_ sender: Any) {
        self.performSegue(withIdentifier: "toPrefectureViewController", sender: self)
    }
    
    // デリゲートの設定
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toPrefectureViewController" {
            if let navigationController = segue.destination as? UINavigationController,
               let prefecturesViewController = navigationController.topViewController as? PrefecturesViewController {
                prefecturesViewController.delegate = self
            }
        }
    }

    // 都道府県名をラベルに表示
    func didSelectPrefectures(_ prefecture: String) {
            textLabel.text = prefecture
    }
    
    //  戻るボタンの設定
    @IBAction func didTapBackButton(segue:UIStoryboardSegue){
    }
}
