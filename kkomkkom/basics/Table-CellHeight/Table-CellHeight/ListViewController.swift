//
//  ListViewController.swift
//  Table-CellHeight
//
//  Created by 문다 on 2023/01/10.
//

import UIKit

class ListViewController: UITableViewController {
    var list = [String]()
    
    @IBAction func add(_ sender: Any) {
        // 1. 알림창 객체의 인스턴스를 생성
        let alert = UIAlertController(title: "목록 입력", message: "추가될 글을 작성해주세요", preferredStyle: .alert)
        
        // 2. 알림창에 입력폼을 추가
        alert.addTextField() { tf in
            tf.placeholder = "내용을 입력하세요"
        }
        
        // 3. OK 버튼 객체 생성: 아직 알림창 객체에 버튼 등록은 X
        let ok = UIAlertAction(title: "OK", style: .default) { _ in
            // 4. 알림창의 0번째 입력필드에 값이 있다면
            if let title = alert.textFields?[0].text {
                // 5. 배열에 입력된 값을 리스트에 추가하고 테이블을 갱신
                self.list.append(title)
                self.tableView.reloadData()
            }
        }
        
        // 6. 취소 버튼 객체 생성: 아직 알림창 객체에 버튼 등록은 X
        let cancel = UIAlertAction(title: "cancel", style: .cancel)
        
        // 7. 알림창 객체에 버튼 등록
        alert.addAction(ok)
        alert.addAction(cancel)
        
        // 8. 알림창을 띄움
        self.present(alert, animated: false)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.list.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // 1. cell이라는 아이디를 가진 셀을 읽어옴. 없으면 인스턴스 생성.
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") ?? UITableViewCell()
        
        // 셀의 기본 텍스트 레이블 행 수 제한을 제거
        cell.textLabel?.numberOfLines = 0
        // 셀의 기본 텍스트 레이블에 배열 변수의 값을 할당
        cell.textLabel?.text = list[indexPath.row]
        return cell
    }
    
    //    // 각 행의 높이를 수동으로 지정해줄 수 있는 메소드
    //    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    //        let row = self.list[indexPath.row]
    //
    //        // 높이 조절: 기본 높이 60 + 글의 길이가 30자를 넘어갈 때마다 20만큼씩 늘려줌
    //        let height = CGFloat(60 + (row.count / 30) * 20)
    //        return height
    //    }
    
    // Self Sizing Cell 방식으로 자동으로 셀 높이 조정
    override func viewWillAppear(_ animated: Bool) {
        // 셀 전체 높이 결정 전 임시로 사용할 셀 높이. 대충 ..
        self.tableView.estimatedRowHeight = 50
        // 높이값이 동적으로 설정될 것은 테이블 뷰에 알려주는 역할
        self.tableView.rowHeight = UITableView.automaticDimension
    }
}
