//
//  ViewController.swift
//  CustomSectionHeader
//
//  Created by Iengpho on 11/1/18.
//  Copyright © 2018 Iengpho. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    let sections: [String] = ["Section 1","Section 2","Section 3"]
    let sectionImages: [UIImage] = [UIImage(named: "facebook")!, UIImage(named: "twitter")!, UIImage(named: "camera")!]
    
    let s1Data: [String] = ["Row 1", "Row 2", "Row 3"]
    let s2Data: [String] = ["Row 1", "Row 2", "Row 3","Row 4"]
    let s3Data: [String] = ["Row 1", "Row 2", "Row 3","Row 4","Row 5"]
    
    var sectionData: [Int: [String]] = [:]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        sectionData = [0:s1Data, 1:s2Data, 2:s3Data]
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (sectionData[section]?.count)!
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sections[section]
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView()
        view.backgroundColor = UIColor.orange
        
        let image = UIImageView(image: sectionImages[section])
        image.frame = CGRect(x: 15, y: 5, width: 35, height: 35)
        view.addSubview(image)
        
        let label = UILabel()
        label.text = sections[section]
        label.frame = CGRect(x: 55, y: 5, width: 100, height: 35)
        view.addSubview(label)
        
        return view
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 45
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("\(indexPath.section) cell \(sectionData[indexPath.section]![indexPath.row])")
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        if cell == nil {
            cell = UITableViewCell.init(style: .default, reuseIdentifier: "cell")
        }
        
        cell?.textLabel?.text = sectionData[indexPath.section]![indexPath.row]
        return cell!
    }
    
    
    
    


}

