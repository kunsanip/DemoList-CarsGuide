
//  ViewController.swift
//  DemoList
//
//  Created by Admin on 8/8/17.
//  Copyright © 2017 Sanip. All rights reserved.
//

import UIKit
import SVProgressHUD
import SDWebImage
import SafariServices

class ListVC: UIViewController {

    var refresher: UIRefreshControl!
    var itemList:[[String:String]] = []
    
    @IBOutlet weak var tblListView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        refresher = UIRefreshControl()
        refresher.addTarget(self, action: #selector(ListVC.refresh(sender:)), for: UIControlEvents.valueChanged)
        self.tblListView.addSubview(refresher)

        tblListView.estimatedRowHeight = 94
        
        getItemList()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func getItemList() {
        Loading(string: "Loading..")
        DispatchQueue.global(qos: .background).async {
            
            do {
                let url=URL(string:"https://api.myjson.com/bins/51mx1")
                let listData = try Data(contentsOf: url!)
                self.itemList = try JSONSerialization.jsonObject(with: listData) as? [[String:String]] ?? []
                
                SVProgressHUD.dismiss()
                
                DispatchQueue.main.async {
                    self.refresher.endRefreshing()
                    self.tblListView.reloadData()
                }
                
            }
            catch {
                SVProgressHUD.dismiss()
                self.itemList = []
                DispatchQueue.main.async {
                    self.tblListView.reloadData()
                }
                print(error)
            }
        }
    }
    
    
    func refresh(sender:AnyObject)
    {
        getItemList()
        tblListView.reloadData()
    }
}




extension ListVC: UITableViewDataSource, UITableViewDelegate {
    // table view data source methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemList.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ListVCCell", for: indexPath) as! ListVCCell
        cell.selectionStyle = .none;
        
        cell.lblTitle.text = itemList[indexPath.row]["title"]!
        cell.lbldecription.text = itemList[indexPath.row]["abstract"]!
        
        if let img = itemList[indexPath.row]["image_url"] {
            let thumbImageUrl = URL(string: img)
            
            //cell.imgListData.sd_setImage(with: thumbImageUrl, placeholderImage: UIImage(named: "placeholder"))
            cell.imgListData.sd_setImage(with: thumbImageUrl, placeholderImage: UIImage(named: "placeholder"), options: SDWebImageOptions.allowInvalidSSLCertificates, completed: { (image, error, cache, url) in
                if error != nil {
                    cell.imgListData.image = UIImage(named: "placeholder")
                    cell.c_imgsize.constant = 0
                } else {
                    cell.c_imgsize.constant = 70
                    cell.imgListData.image = image
                }
            })
            
        } else {
            
        }
        
        return cell
    }
    
    // Delegate Methods
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        if let urlString = itemList[indexPath.row]["image_url"] {
            let safariVC = SFSafariViewController(url: URL(string: urlString)!)
            self.present(safariVC, animated: true, completion: nil)
        }
        
    }
}
