//
//  ViewController.swift
//  PracticeTable
//
//  Created by 문다 on 2021/07/14.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var TableViewMain: UITableView!
    
    var newsData : Array<Dictionary<String, Any>>?
    
    //1. http 통신 방법 : urlsession을 이용
    //2. JSON 데이터 형태
//    { 아니 똑같은건데 뭔가 달라 아니 내가 지금 여는게
    // 화면 보이는게 왜 다른지 모르겠음
 
//        [
//            {"돈":"100"},
//            {"돈":"1000"},
//            {"돈":"10000"}
//        ]
//    }
    //3. 테이블 뷰에 데이터 매칭
    //4. 모바일이 네트워크 통신을 하게되면 background에서 진행됨
    
    // api 이용 주소는 newsapi.org :: 하루 500회까지 무료
    func getNews() {
        let task = URLSession.shared.dataTask(with: URL(string: "https://newsapi.org/v2/everything?q=keyword&apiKey={my_api_key}")!) { (data, response, error) in
            if let dataJson = data{
                
                //json parsing
                do {
                    let json = try JSONSerialization.jsonObject(with: dataJson, options: []) as! Dictionary<String, Any>
                    
                    //Dictionary
                    let articles = json["articles"] as! Array<Dictionary<String, Any>>
                    print(articles)
                    self.newsData = articles
                    
                    DispatchQueue.main.async{ // 비동기적으로
                        self.TableViewMain.reloadData() // 데이터가 들어왔으므로 재로딩
                    }
                    
//                    for (idx, value) in articles.enumerated() { // for문 사용하는 방법 by index
//                        if let v = value as? Dictionary<String, Any>{
//                            print("\(v["title"])")
//                        }
//                    }
                } catch {}
            }
        }
        task.resume()
    }
    
    // UITableViewDelegate, UITableViewDataSource는 구현이 필요함, 없으면 오류발생
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // 데이터 몇개 -> 반환은 숫자겠지
        if let news = newsData{
            return news.count // 배열의 수는 count로 가져옴
        }else{
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // 데이터 종류 -> 셀이 반복된다, 위의 반환되는 개수만큼
        // 방법1. 임의의 셀을 생성
//        let cell = UITableViewCell.init(style: .default, reuseIdentifier: "TableCellType1")
//        cell.textLabel?.text = "\(indexPath.row)"
        
        // 방법2. 스토리보드 + id
        let cell = TableViewMain.dequeueReusableCell(withIdentifier: "Type1", for: indexPath) as! Type1
        //as?와 as! 두 종류가 있음 :: as?는 식별이 필요, as!는 형 검사가 필요하지 않음.
        
        let idx = indexPath.row
        if let news = newsData{
            
            let row = news[idx]
            if let r = row as? Dictionary<String, Any>{
                if let title = r["title"] as? String{
                    cell.LabelText.text = title
                }
            }
        }
        
        return cell
    }
    
    // 1. click action : 이동을 수동으로, to News Detail
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "NewsDetailController") as! NewsDetailController
        
        if let news = newsData{
            let row = news[indexPath.row]
            if let r = row as? Dictionary<String, Any>{
                if let imageUrl = r["urlToImage"] as? String{
                    controller.imageUrl = imageUrl
                }
                if let desc = r["description"] as? String{
                    controller.desc = desc
                }
            }
        }
//        showDetailViewController(controller, sender: nil)
    }
    // 그 그 뭐지 그거 어어 ㅇㅇ너네가 만들어도 비슷할걸? ㅋㅋㅋㅋㅋㅋ 이번에 대회 진행하나함 어드민이랑 웨볼루션 아니 안만들었는데 어 갑자기 왜 두개뜨냐헐 알았다 ㄴㄴ 그냥 연습용야 쩝 승오 무슨 계산기만들던데 ㅋㅋㅋㅋ 시발 이거 원래 연결돼야하는데 안떠
    
    //2. 세그웨로 화면 이동 전에 값을 먼저 보내는 방식을 이용 (값 세팅)
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let id = segue.identifier, "NewsDetail" == id{
            if let controller = segue.destination as? NewsDetailController{
                if let news = newsData{
                    if let indexPath = TableViewMain.indexPathForSelectedRow{
                        let row = news[indexPath.row]
                        if let r = row as? Dictionary<String, Any>{
                            if let imageUrl = r["urlToImage"] as? String{
                                controller.imageUrl = imageUrl
                            }
                            if let desc = r["description"] as? String{
                                controller.desc = desc
                            }
                        }
                    }
                }
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        TableViewMain.delegate = self
        TableViewMain.dataSource = self
        
        getNews()
    }

    // table view 여러 행들로 정렬된 목록, 뷰
    // 사용 목적 - 데이터를 정갈하게 보여주기 위함
    
    // 사용하기 전에 고려할 요소
    // 1. 데이터 종류    2. 데이터 개수    3. (option) 셀 클릭 액션

}

