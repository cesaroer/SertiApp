//
//  MenuViewController.swift
//  sertiAppPrueba
//
//  Created by Cesar on 29/03/20.
//  Copyright © 2020 CesarVargas. All rights reserved.
//

import UIKit

enum MenuType: Int{
    case home
    case profile
    case logout
}

class MenuViewController: UITableViewController {
    @IBOutlet weak var loggedUsrLbl: UILabel!
    
    var didTapMenuType: ((MenuType) -> Void)?

    override func viewDidLoad() {
        super.viewDidLoad()
        loggedUsrLbl.text = UserDefaults.standard.string(forKey: "email")

        // Do any additional setup after loading the view.
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let menuType = MenuType(rawValue: indexPath.row) else {return}
        dismiss(animated: true) { [weak self] in
            print("Dismissing: \(menuType)")
            self?.didTapMenuType?(menuType)
        }
    }
    


}
