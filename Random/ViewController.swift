//
//  ViewController.swift
//  Random
//
//  Created by 鈴木理紗子 on 2023/06/28.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    var numbers = [Int]()
        
    override func viewDidLoad() {
        super.viewDidLoad()
            
            // ランダムな数字の一覧を生成
            generateRandomNumbers()
            
            // TableViewのデリゲートとデータソースを設定
            tableView.delegate = self
            tableView.dataSource = self
            
            // TableViewのセルの高さを設定
            tableView.rowHeight = 44
        }
        
        // ランダムな数字の一覧を生成するメソッド
        func generateRandomNumbers() {
            while numbers.count < 20 {
                let randomNumber = Int.random(in: 1...100)
                if !numbers.contains(randomNumber) {
                    numbers.append(randomNumber)
                }
            }
        }
        
        // TableViewのセクション数を返すメソッド
        func numberOfSections(in tableView: UITableView) -> Int {
            return 1
        }
        
        // TableViewのセル数を返すメソッド
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return numbers.count
        }
        
        // TableViewのセルを構築するメソッド
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
            let number = numbers[indexPath.row]
            cell.textLabel?.text = "\(number)"
            
            // 条件によってテキストの色を変更
            if number >= 50 {
                cell.textLabel?.textColor = .systemPink
            } else {
                cell.textLabel?.textColor = .black
            }
            
            return cell
        }
    }

        // Do any additional setup after loading the view.
    

