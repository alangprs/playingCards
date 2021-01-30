

import UIKit

class ViewController: UIViewController {
    
    //結果label
    @IBOutlet weak var resultLabel: UILabel!
    
    @IBOutlet var imageView: [UIImageView]! //顯示圖片
    var cards = [Card]() //導入自定義資料

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    
        /*
            利用巢狀迴圈將花色跟數字結合，存進自定義屬性Card裡
         */
        for cube in cube{ //花色
            for rank in rank{ //數字
                var card = Card()
                card.Cube = cube
                card.Rank = rank
                cards.append(card)
            }
        }
    
    }
    
    //判斷花色func
    func judgeCubeFunc(cards:Card) -> Int{
        var cubeNumber = 0
        switch cards.Cube {
        case "Plum":
            cubeNumber = 1
        case "Cube":
            cubeNumber = 2
        case "Love":
            cubeNumber = 3
        default:
            cubeNumber = 4
        }
        return cubeNumber
        
    }
    //判斷數字func
    func judgeRankFunc(cards:Card) -> Int{
        var rankNumber = 0
        if cards.Rank == "1"{ //判斷Ａ是最大的
            rankNumber = 14
        }else{
            rankNumber = Int("\(cards.Rank)")!
        }
        return rankNumber
    }

    //開牌按鈕
    @IBAction func again(_ sender: UIButton) {
            //亂數產生圖片
        cards.shuffle()

        /*
            宣一個常數存電腦、玩家 用迴圈將名字跟數字組合起來的照片名稱
            電腦 = [0] 玩家 = [1]
            */
        let 電腦 = cards[0]
        //電腦卡片
        imageView[0].image = UIImage(named:"\(電腦.Cube)\(電腦.Rank)")
        
        let 玩家 = cards[1]
        //玩家卡片
        imageView[1].image = UIImage(named: "\(玩家.Cube)\(玩家.Rank)")
       
        
        /*
          先數字判斷大小
          如果數字一樣，判斷花色來決定誰大誰小
          */
        let 判斷電腦數字 = judgeRankFunc(cards: cards[0])
        let 判斷玩家數字 = judgeRankFunc(cards: cards[1])
        
        if 判斷電腦數字 > 判斷玩家數字{
            resultLabel.text = "電腦獲勝"
        }else if 判斷電腦數字 < 判斷玩家數字{
            resultLabel.text = "玩家獲勝"
        }else{
            resultLabel.text = "平手拉"
        }
        
        
        
        
        
}

}
