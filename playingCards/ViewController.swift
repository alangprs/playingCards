

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
        for cube in 0..<cube.count{ //花色
            for rank in 0..<rank.count{ //數字
                var card = Card()
                card.Cube = "\(cube)"
                card.Rank = "\(rank)"
                cards.append(card)
            }
        }
        
        
    }
    //開牌按鈕
    @IBAction func again(_ sender: UIButton) {
            //亂數產生圖片
        cube.shuffle() //亂數花色
        rank.shuffle() //亂數數字
        
        /*
            宣一個常數存電腦、玩家 用迴圈將名字跟數字組合起來的照片名稱
            電腦 = [0] 玩家 = [1]
            */
        //電腦卡片
        let computerCard = cube[0]+rank[0]
        imageView[0].image = UIImage(named: "\(computerCard)")
        //玩家卡片
        let myCard = cube[1]+rank[1]
        imageView[1].image = UIImage(named: "\(myCard)")
        
        /*
            花色是string不好比大小，用firstIndex判斷string在array的順序決定大小
            將A(1) 設為最大數
            將rank轉為數字方便比大小
         */
        //電腦花色
        let computerCube = cube.firstIndex(of:cube[0])
        //電腦數字 轉int
        var computerNumber = 0
         if rank[0] == "1"{
             computerNumber = 14
         }else{
             computerNumber = Int("\(rank[0])")!
         }
        //玩家花色
        let myCube = cube.firstIndex(of: cube[1])
        //玩家數字 轉int
        var myNumber = 0
        if rank[1] == "1"{
            myNumber = 14
        }else{
            myNumber = Int("\(rank[1])")!
        }
        
       
        /*
          先數字判斷大小
          如果數字一樣，判斷花色來決定誰大誰小
          */
        if computerNumber == myNumber{
            
            if computerCube! > myCube!{
            resultLabel.text = "電腦贏"
            }else if computerCube! < myCube!{
                resultLabel.text = "玩家贏"
        }
        }else if computerNumber > myNumber{
            resultLabel.text = "電腦贏"
        }else{
            resultLabel.text = "玩家贏"
        }
        

    }
  
}

