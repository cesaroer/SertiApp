//
//  Styles.swift
//  sertiAppPrueba
//
//  Created by Cesar on 27/03/20.
//  Copyright © 2020 CesarVargas. All rights reserved.
//

import Foundation
import UIKit

class Styles {
    
    static func styleTextField(_ textfield:UITextField) {
        
        //Creamos la linea de abajo como una vista
        let bottomtxtfldLine = UIView()
    
        //Damos tamaño  y color
        bottomtxtfldLine.frame = CGRect(x: 0, y: textfield.frame.height - 2, width: textfield.frame.width, height: 2)
        bottomtxtfldLine.backgroundColor = UIColor.myGreen
        //Damos estilo y presentamos en la vista
        textfield.borderStyle = .none
        textfield.addSubview(bottomtxtfldLine)
        
        //Añadimos constraints adecuados para el diseño apegado al texfield
        bottomtxtfldLine.translatesAutoresizingMaskIntoConstraints = false

        bottomtxtfldLine.widthAnchor.constraint(equalTo: textfield.widthAnchor, constant: 0).isActive = true
        bottomtxtfldLine.heightAnchor.constraint(equalToConstant: 1).isActive = true
        bottomtxtfldLine.bottomAnchor.constraint(equalTo: textfield.bottomAnchor, constant: 0).isActive = true
        
    }
    
    static func styleFilledButton(_ button:UIButton) {
        
        // Filled rounded corner style
        button.backgroundColor = UIColor.myGreen
        button.layer.cornerRadius = 25.0
        button.tintColor = UIColor.white
    }
    
    static func styleHollowButton(_ button:UIButton) {
        
        // Hollow rounded corner style
        button.layer.borderWidth = 2
        button.layer.borderColor = UIColor.myBlue.cgColor
        button.layer.cornerRadius = 25.0
        button.tintColor = UIColor.myBlue
    }
    
    
    //Funcion que valida la contraseña
    static func isPasswordValid(_ password : String) -> Bool {
        
        //Expresion regular con la que validaremos el formato de la contraseña
        let passwordTest = NSPredicate(format: "SELF MATCHES %@", "^(?=.*[a-z])(?=.*[$@$#!%*?&])[A-Za-z\\d$@$#!%*?&]{8,}")
        
        
        return passwordTest.evaluate(with: password)
    }
    
}

