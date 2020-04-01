//
//  ProfileViewController.swift
//  sertiAppPrueba
//
//  Created by Cesar on 31/03/20.
//  Copyright © 2020 CesarVargas. All rights reserved.
//

import UIKit
import Alamofire

class ProfileViewController: UIViewController {

    @IBOutlet var usrImageView: UIImageView!
    @IBOutlet var usrNameLbl: UILabel!
    @IBOutlet var usrApellidoLbl: UILabel!
    @IBOutlet var usrEmaillabl: UILabel!
    @IBOutlet var companyLbl: UILabel!
    @IBOutlet var urlCmpnyLbl: UILabel!
    @IBOutlet var sloganLbl: UILabel!
    @IBOutlet var usrIdLbl: UILabel!
    
    var usrImage : UIImage?
    var name = ""
    var lastName = ""
    var email = ""
    var usrId = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        usrImageView.image = usrImage!
        usrNameLbl.text = name
        usrApellidoLbl.text = lastName
        usrEmaillabl.text = email
        usrIdLbl.text = String(usrId)
        
        
        usrImageView.layer.masksToBounds = true
        usrImageView.layer.cornerRadius = usrImageView.frame.width / 2
        
    }


}
