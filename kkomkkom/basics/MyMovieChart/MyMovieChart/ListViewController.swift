//
//  ListViewController.swift
//  MyMovieChart
//
//  Created by 문다 on 2023/01/09.
//

import UIKit

class ListViewController: UITableViewController {
    
    // 테이블 뷰를 구성할 리스트 데이터
    lazy var list: [MovieVO] = {
        var datalist = [MovieVO]()
        return datalist
    }()
    
    override func viewDidLoad() {
        // 1. hoppin API 호출을 위한 URI 생성
        let url = "http://swiftapi.rubypaper.co.kr:2029/hoppin/movies?version=1&page=1&count=10&genreId=&order=releasedateasc"
        let apiURI: URL! = URL(string: url)
        
        // 2. REST API 호출
        let apidata = try! Data(contentsOf: apiURI)
        
        // 3. 데이터 전송 결과를 로그로 출력 (반드시 필요한 코드는 아님)
        let log = NSString(data: apidata, encoding: String.Encoding.utf8.rawValue) ?? ""
        NSLog("API Result=\( log )")
        
        // 4. JSON 객체를 파싱하여 NSDictionary 객체로 받음
        do {
            let apiDictionary = try JSONSerialization.jsonObject(with: apidata, options: []) as! NSDictionary
            
            // 5. 데이터 구조에 따라 차례대로 캐스팅하며 읽어옴
            let hoppin = apiDictionary["hoppin"] as! NSDictionary
            let movies = hoppin["movies"] as! NSDictionary
            let movie = movies["movie"] as! NSArray
            
            // 6. Iterator 처리를 하면서 API 데이터를 MovieVO 객체에 저장
            for row in movie {
                // 순회 상수를 NSDictionary 타입으로 캐스팅
                let r = row as! NSDictionary
                
                // 테이블 뷰 리스트를 구성할 데이터 형식
                let mvo = MovieVO()
                
                // movie 배열의 각 데이터를 mvo 상수의 속성에 대입
                mvo.title = r["title"] as? String
                mvo.description = r["genreNames"] as? String
                mvo.thumbnail = r["thumbnailImage"] as? String
                mvo.detail = r["linkUrl"] as? String
                mvo.rating = ((r["ratingAverage"] as! NSString).doubleValue)
                
                // add in list array
                self.list.append(mvo)
            }
        } catch { NSLog( "catch: ListViewController:: viewDidLoad()") }
    }
    
    // 테이블 뷰가 생성해야 할 행(row)의 개수를 반환
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // return 테이블 뷰의 목록의 길이(row의 개수)
        return self.list.count
    }
    
    // 각 행이 화면에 표현해야 할 내용을 구성하는 데 사용
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // return 테이블 뷰 셀 인스턴스
        let row = self.list[indexPath.row] // indexPath.row에 해당하는 데이터 소스를 읽어옴
        
        
        // =========== 셀에 대한 클래스를 정의한 Custom Prototype Cell 이용 ===========
        let cell = tableView.dequeueReusableCell(withIdentifier: "ListCell") as! MovieCell
        cell.title.text = row.title
        cell.desc.text = row.description
        cell.opendate.text = row.opendate
        cell.rating.text = "\(row.rating!)"
        
        // 썸네일 경로를 인자값으로 하는 URL 객체를 생성
        let url: URL! = URL(string: row.thumbnail!)
        
        // 이미지를 읽어와 Data 객체에 저장
        let imageData = try! Data(contentsOf: url)
        
        // UIImage 객체를 생성하여 아울렛 변수의 image 속성에 대입
        cell.thumbnail.image = UIImage(data: imageData)
        // =========== 여기까지 Prototype Cell (UITableViewCell 정의) ===========
        
        
        
        // =========== Custom Prototype Cell의 tag를 이용 ===========
        //        // 테이블 셀 객체를 직접 생성하는 대신 큐로부터 가져옴
        //        let cell = tableView.dequeueReusableCell(withIdentifier: "ListCell")!
        //
        //        // Custom prototype cell 속성과 데이터 바인딩
        //        let title = cell.viewWithTag(101) as? UILabel
        //        let description = cell.viewWithTag(102) as? UILabel
        //        let opendate = cell.viewWithTag(103) as? UILabel
        //        let rating = cell.viewWithTag(104) as? UILabel
        //
        //        // 데이터 셋에 저장된 값을 각 레이블에 알맞게 할당
        //        title?.text = row.title
        //        description?.text = row.description
        //        opendate?.text = row.opendate
        //        rating?.text = "\(row.rating!)"
        // =========== 여기까지 Custom Prototype Cell ===========
        
        
        
        // =========== 기본 제공되는 Prototype Cell (Subtitle) 이용 ===========
        //        cell.textLabel?.text = row.title // Title
        //        cell.detailTextLabel?.text = row.description // Subtitle
        // =========== 여기까지 Prototype Cell (Subtitle) ===========
        

        

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        NSLog("선택된 행은 \(indexPath.row)번째 행입니다.")
    }
}
