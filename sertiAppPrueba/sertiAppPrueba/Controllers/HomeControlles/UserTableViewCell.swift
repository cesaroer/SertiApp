//
//  UserTableViewCell.swift
//  sertiAppPrueba
//
//  Created by Cesar on 28/03/20.
//  Copyright © 2020 CesarVargas. All rights reserved.
//

import UIKit

class UserTableViewCell: UITableViewCell {
    @IBOutlet weak var usrIdLbl: UILabel!
    @IBOutlet weak var usrEmailLbl: UILabel!
    @IBOutlet weak var usrApLbl: UILabel!
    @IBOutlet weak var usrNameLbl: UILabel!
    @IBOutlet weak var usrAvatarImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
