//
//  HomePrePayViewController.swift
//  CustomAnyThink
//
//  Created by ManhCuong on 9/25/19.
//  Copyright © 2019 encodejsc. All rights reserved.
//

import UIKit
struct Data {
    var mb: String?
    var time: String?
    var vnd: String?
    init(mb: String, time: String, vnd: String) {
        self.mb = mb
        self.time = time
        self.vnd = vnd
    }
}
class HomePrePayViewController: UIViewController, UITableViewDataSource, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    var arr: [Data] = [Data]()
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var sliderControl: MVSlider!
    override func viewDidLoad() {
        super.viewDidLoad()
        setButtonBarLeft()
        arr = [Data.init(mb: "500MB/", time: "24h ngày đăng ký", vnd: "5.000đ"),
               Data.init(mb: "1536MB/", time: "theo gói Data chính", vnd: "15.000đ"),
               Data.init(mb: "2040MB/", time: "theo gói Data chính", vnd: "30.000đ")]
        tableView.dataSource = self
        collectionView.dataSource = self
        tableView.register(UINib(nibName: "HomePrePayTableViewCell", bundle: nil), forCellReuseIdentifier: "HomePrePayTableViewCell")
        collectionView.register(UINib(nibName: "HomePrePayCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "HomePrePayCollectionViewCell")
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arr.count
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HomePrePayTableViewCell", for: indexPath) as! HomePrePayTableViewCell
        cell.lblMb.text = arr[indexPath.row].mb
        cell.lblTime.text = arr[indexPath.row].time
        cell.lblVnd.text = arr[indexPath.row].vnd
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.height, height: collectionView.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomePrePayCollectionViewCell", for: indexPath)
        return cell
    }
}
