//
//  MainDataTableViewCell.swift
//  DemoLumiq
//
//  Created by Mobikasa on 5/31/19.
//  Copyright © 2019 Ashutosh. All rights reserved.
//

import UIKit
typealias getButtonClosure = () -> ()
class MainDataTableViewCell: UITableViewCell {
    
    @IBOutlet weak var bottomView: UIView!
    @IBOutlet weak var containerView: UIView!
   
    @IBOutlet weak var imageData: UIImageView!
    @IBOutlet weak var containerStackView: UIStackView!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var getButton: UIButton!
    var getButtonClosure: getButtonClosure?
    override func awakeFromNib() {
        super.awakeFromNib()
        self .shadowOffset(button: getButton)
        self.shadowOffsetForContainerView(view: containerView)
        self.shadowOffset(button: containerStackView)
        
    }
    
    // MARK:- shadow and corner radius on get button
    func shadowOffset(button:UIView){
        button.layer.cornerRadius = 9
        button.layer.shadowRadius = 5
        button.layer.shadowColor = UIColor.gray.cgColor
        button.layer.shadowOpacity = 0.5
        button.layer.shadowOffset = CGSize(width:0, height:1)
        button.layer.masksToBounds = false
    }
    // MARK:- shadow and corner radius on Container View
    func shadowOffsetForContainerView(view:UIView){
        view.layer.cornerRadius = 13
        view.layer.shadowRadius = 9
        view.layer.shadowColor = UIColor.gray.cgColor
        view.layer.shadowOpacity = 0.5
        view.layer.shadowOffset = CGSize(width:1, height:3)
        view.layer.masksToBounds = false
    }
    
    @IBAction func actionGetButton(_ sender: UIButton) {
        if getButtonClosure != nil {
            self.getButtonClosure!()
        }
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
