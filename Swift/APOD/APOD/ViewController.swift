//
//  ViewController.swift
//  APOD
//
//  Created by 문다 on 2021/09/18.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet weak var apodCollectionView: UICollectionView!
    var index: Int = 0
    var apods: [APOD]? = nil{
        didSet{
            print("설정됐다!")
//            apodCollectionView.reloadData() // 리로드는 메인에서 해야한다고 에러가 뜸
            DispatchQueue.main.async {
                self.apodCollectionView.reloadData()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // delegate 패턴 : 대행자
        apodCollectionView.delegate = self
        // dateSource : 어떤 데이터가 필요해
        apodCollectionView.dataSource = self
        
        self.title = "APOD"
        
        //callback closure completionhandler
        APIService.fetchAPOD{ apods in
            self.apods = apods
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let detailViewController = segue.destination as? DetailViewController else { return }
        guard let apod = apods? [index] else { return }
        detailViewController.apod = apod
//        detailViewController.index = self.index
    }
    
    // 아이템 몇개 넣을거야
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let apods = self.apods else { return 0 }
        return apods.count
    }
    
    // 무슨 데이터 넣을거야
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = UICollectionView() // +) view를 만드는건 cost가 높다. 그래서 이런식으로 매번 뷰를 만드는 걸 금지해서 오류난거
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ApodCollectionViewCell", for: indexPath) as? ApodCollectionViewCell,
              let apod = apods?[indexPath.item] else {return UICollectionViewCell() }
        
        APIService.fetchData(url: apod.url) { data in
                    cell.thumbnailImageView.image = UIImage(data: data)
                }
                cell.thumbnailImageView.contentMode = .scaleAspectFill
//        cell.backgroundColor = .red
        // 없으면 생성하고 있으면 데이터만 불러오겠다
        
        // 재사용이 되는 셀이기 때문에 값이 초기화가 안됨. 그래서 스크롤해보면 10번째 인덱스가 아닌 셀에도 코드가 적용되는데,
        // 스크로를 하다보면 점점 늘어나기도 하는 것이 셀을 재사용하기 때문!
//        if indexPath.row == 10{
//            cell.thumbnailImageView.backgroundColor = .red
//        }else{ // 이거 추가하면 side effect를 처리해줄 수 있겠지
//        cell.thumbnailImageView.backgroundColor = .red
//    }
        
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        index = indexPath.row
        // 코드로 세그웨 방식 정의하기
        performSegue(withIdentifier: "segueToDetailViewController", sender: self)
    }
    
    // 아래는 셀들의 사이즈, 간격을 조정해주는 코드
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 2
    }
        
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 2
    }
    
    // 이거는 인스타처럼 셀이 세개씩 보이게 해주는 코드 
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (view.frame.width - 4) / 3
            
        return CGSize(width: width, height: width)
    }
    
    //collectionView의 show the size inspector : estimate size를 automatic to None
}

