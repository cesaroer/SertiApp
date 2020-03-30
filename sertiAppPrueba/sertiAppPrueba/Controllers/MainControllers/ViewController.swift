//
//  ViewController.swift
//  sertiAppPrueba
//
//  Created by Cesar on 27/03/20.
//  Copyright © 2020 CesarVargas. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var signupButton: UIButton!
    @IBOutlet weak var loginButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupElements()
    }

//MARK: Funcion que dará el estílo a nuestros botones
    func setupElements(){
       
        //Aplicamos los estilos a el boton
        Styles.styleFilledButton(signupButton)
        Styles.styleHollowButton(loginButton)
    }


}
