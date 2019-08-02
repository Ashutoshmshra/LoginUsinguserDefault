//
//  MainViewController.swift
//  DemoLumiq
//
//  Created by Mobikasa on 5/31/19.
//  Copyright © 2019 Ashutosh. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    var myTableView: UITableView  =   UITableView()
    var itemsToLoad: [String] = ["One", "Two", "Three"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(red: 246/255.0, green: 246/255.0, blue: 246/255.0, alpha: 1)
        self.createHeaderLabel()
        self.createTableView()
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    // MARK:- Create Header Message
    func createHeaderLabel(){
        let label:UILabel = UILabel(frame: CGRect(x: 20, y: 30, width: 300, height: 30))
        label.textColor = .black
        label.textAlignment = .center
        label.text = "Hi there!"
        label.font = UIFont.systemFont(ofSize: 24)
        label.backgroundColor = UIColor(red: 246/255.0, green: 246/255.0, blue: 246/255.0, alpha: 1)
        self.view.addSubview(label)
    }
    
    // MARK:- Create table view to show Data
    func createTableView(){
        let screenSize: CGRect = UIScreen.main.bounds
        
        let screenWidth = screenSize.width
        let screenHeight = screenSize.height
        
        myTableView.frame = CGRect(x:0, y:70, width:screenWidth, height:screenHeight-60);
        myTableView.dataSource = self
        myTableView.delegate = self
        myTableView.separatorStyle = .none
        myTableView.backgroundColor  = UIColor(red: 246/255.0, green: 246/255.0, blue: 246/255.0, alpha: 1)
        myTableView.showsVerticalScrollIndicator = false
        myTableView.showsHorizontalScrollIndicator = false
        
        myTableView.register(UINib(nibName: "MainDataTableViewCell", bundle: nil), forCellReuseIdentifier: "MainDataTableViewCell")
        
        self.view.addSubview(myTableView)
    }
    // MARK:- show alert on Get button action
    func showAlert(message: String){
        // create the alert
        let alert = UIAlertController(title: "Alert", message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Dismiss", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
}

// MARK:- Table view delegate and DataSource
extension MainViewController: UITableViewDelegate, UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemsToLoad.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MainDataTableViewCell", for: indexPath) as! MainDataTableViewCell
        cell.titleLabel.text = itemsToLoad[indexPath.row]
        cell.getButtonClosure = { () in
            self.showAlert(message: "Button Click.")
        }
        cell.backgroundColor = UIColor(red: 246/255.0, green: 246/255.0, blue: 246/255.0, alpha: 1)
        cell.selectionStyle = .none
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 240
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
}
