//
//  MainScreen.swift
//  PodCastApp
//
//  Created by Techmaster on 4/15/19.
//  Copyright © 2019 Techmaster. All rights reserved.
//

import UIKit
import Stevia
class MainScreen: UIViewController {
    let Featured = UILabel(text: "Featured", hexcolor: 0xFFFFFF, fontface: "iCielGotham-Medium", fontsize: 25)//UILabel(frame: CGRect.zero)
    let Search = UIImageView(frame: CGRect.zero)
    
    let FeaturedScroll = UIScrollView(frame: CGRect.zero)
    let MyPodCastTable = UITableView(frame: CGRect.zero, style: .plain)
    
    let MyPodCasts = UILabel(text: "My PodCasts", hexcolor: 0xFFFFFF, fontface: "iCielGotham-Medium", fontsize: 25)
    
    let ThreeDots = UIImageView(frame: CGRect.zero)
    
    let viewAbove = UIView()
    let viewBelow = UIView()
    let margin: CGFloat = 8
    
    var myPodCasts : [MyPodCast]!
    let cellID = "cell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(rgb: 0x350e64)
        setUpData()
        setUpControl()
    }
    
    func setUpControl() {
        view.sv(
            viewAbove,
            viewBelow
        )
        
        view.layout(
            |-viewAbove-| ~ 200,
            |-viewBelow-|,
            margin
        )
        viewAbove.Top == view.safeAreaLayoutGuide.Top
        
        setUpViewAbove()
        setUpViewBelow()
    }
    
    func setUpViewAbove() {
        Featured.frame = CGRect.zero
        Search.image = UIImage(named: "Search")
        Search.contentMode = .scaleAspectFit
        Search.isUserInteractionEnabled = true
        Search.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(onSearchTap)))
        viewAbove.sv(Featured,Search, FeaturedScroll)
        viewAbove.layout(
            margin,
            |-Featured-(>=30)-Search-| ~ 20,
            8,
            |-FeaturedScroll-|,
            0
        )
        
        
        
    }
    
    func setUpViewBelow() {
        MyPodCasts.frame = CGRect.zero
        ThreeDots.image = UIImage(named: "dots")
        ThreeDots.contentMode = .scaleAspectFit
        
        MyPodCastTable.register(MyPodCastCell.self, forCellReuseIdentifier: cellID)
        MyPodCastTable.rowHeight = 100
        MyPodCastTable.dataSource = self
        MyPodCastTable.delegate = self
        MyPodCastTable.backgroundColor = UIColor.clear
        MyPodCastTable.separatorStyle = .none
        
        viewBelow.sv(
            MyPodCasts,
            ThreeDots,
            MyPodCastTable            
        )
        viewBelow.layout(
            margin,
            |-MyPodCasts-(>=30)-ThreeDots-| ~ 20,
            8,
            |-MyPodCastTable-|,
            0
        )
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        setUpFeatureScroll()
        print(FeaturedScroll)
    }
    
    func setUpFeatureScroll() {
       
        let featureImageWidth: CGFloat = 335.0
        let featureImageHeight: CGFloat = 158.0
        
        let features: [FeaturedPodCast] = [
            FeaturedPodCast(image: "Featured1", title: "Paris Climate Accord Woes and Kathy Griffin Takes Heat", subtitle: "Fake the nation"),
            FeaturedPodCast(image: "Featured2", title:"THIS IS Tuan Hung", subtitle:"Tình ca bất hủ của Tuấn Hưng"),
            FeaturedPodCast(image: "Featured3", title: "Peaceful Piano", subtitle: "Cho một ngày mưa gió"),
            FeaturedPodCast(image: "Featured4", title: "Kitaro - Life and Earth", subtitle: "Tuyệt phẩm Kitaro")]
        
        FeaturedScroll.contentSize = CGSize(width: (featureImageWidth + margin) * CGFloat(features.count), height: featureImageHeight)
        
        for (index, feature) in features.enumerated(){
            let featurePodView = FeaturedPodView(data: feature)
            featurePodView.frame = CGRect(x: CGFloat(index) * (featureImageWidth + margin), y: 0, width: featureImageWidth, height: featureImageHeight)
            FeaturedScroll.addSubview(featurePodView)
        }
        
    }
    
    @objc func onSearchTap() {
        print ("Search Tap")
    }
    
    func setUpData() {
        myPodCasts = [
            MyPodCast(photo: "pod1", title: "Comedy Bang -Bang"),
            MyPodCast(photo: "pod2", title: "How Did This Get Ma..."),
            MyPodCast(photo: "pod3", title: "With Special Guest..."),
            MyPodCast(photo: "pod4", title: "The Flop House"),
            MyPodCast(photo: "pod5", title: "U Talkin' U22 Me ?"),
            MyPodCast(photo: "pod6", title: "Wellcome to Night...")
        ]
    }
}

extension MainScreen : UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myPodCasts.count % 2 == 0 ? myPodCasts.count / 2 : myPodCasts.count / 2 + 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! MyPodCastCell
        
     /*   if (cell == nil) {
            cell = MyPodCastCell.init(style: .default, reuseIdentifier: cellID)
            
        }*/
        
        cell.setData(dataForLeftCell: myPodCasts[indexPath.row * 2], dataForRightCell: myPodCasts[indexPath.row * 2 + 1])
        return cell
    }
    
    
}

extension MainScreen : UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 190
    }
}
