//
//  ListViewController.swift
//  MyMovieChart
//
//  Created by 문다 on 2023/01/09.
//

import UIKit

class ListViewController: UITableViewController {
    
    // tuple로 구성된 데이터 셋
    var dataset = [("다크나이트", "영웅물에 철학에 음악까지 더해져 예술이 되다.", "2008-09-04", 8.95),
                   ("호우시절", "때를 알고 내리는 좋은 비", "2009-10-08", 7.31),
                   ("말할 수 없는 비밀", "여기서 너까지 다섯 걸음", "2015-05-07", 9.19)]
    
    // 테이블 뷰를 구성할 리스트 데이터
    lazy var list: [MovieVO] = {
        var datalist = [MovieVO]()
        for (title, description, opendate, rating) in self.dataset {
            let mvo = MovieVO()
            mvo.title = title
            mvo.description = description
            mvo.opendate = opendate
            mvo.rating = rating
            
            datalist.append(mvo)
        }
        return datalist
    }()
    
    // 테이블 뷰가 생성해야 할 행(row)의 개수를 반환
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // return 테이블 뷰의 목록의 길이(row의 개수)
        return self.list.count
    }
    
    // 각 행이 화면에 표현해야 할 내용을 구성하는 데 사용
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // return 테이블 뷰 셀 인스턴스
        let row = self.list[indexPath.row] // indexPath.row에 해당하는 데이터 소스를 읽어옴
        // 테이블 셀 객체를 직접 생성하는 대신 큐로부터 가져옴
        let cell = tableView.dequeueReusableCell(withIdentifier: "ListCell")!
        cell.textLabel?.text = row.title // Title
        cell.detailTextLabel?.text = row.description // Subtitle
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        NSLog("선택된 행은 \(indexPath.row)번째 행입니다.")
    }
}
