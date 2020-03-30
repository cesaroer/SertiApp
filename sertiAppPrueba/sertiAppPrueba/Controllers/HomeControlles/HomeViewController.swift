//
//  HomeViewController.swift
//  sertiAppPrueba
//
//  Created by Cesar on 28/03/20.
//  Copyright © 2020 CesarVargas. All rights reserved.
//

import UIKit
import Alamofire

class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var usrTableView: UITableView!
    //Variable que nos desplegará el numero de filas en la tabla
    var rows = 0
    //Estructura en la cual guardaremos los detalles de los usuarios
    var usrsData : [DatUsr]?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        usrTableView.delegate = self
        usrTableView.dataSource = self
        
        getUsrList()

    }
    
//MARK: Funciones getUser
    
    func getUsrList() {
        let urlString = "https://reqres.in/api/users"
        let urlToRequest = URL(string: urlString)!
        //Se crea el diccionario con parametros a enviar
        //Peticion Post
        AF.request(urlToRequest)
            .responseJSON { (response) in
            switch response.result {
                case .success:
                    print(" Respuesta a peticion GET: \(response.result)")
                    //Pasamos la respuesta de JSON a una Struct de neustro modelo
                    let decoder = JSONDecoder()
                    if let usrData = try? decoder.decode(GetUsers.self, from: response.data!){
                        //El numero de elementos que tenamos de la respuesta será el número de rows en la tabla
                        self.rows = usrData.data!.count
                        //Guardamos en nuestra variable global la respuesta
                        self.usrsData = usrData.data!
                    }
                    //Recargamos la información en la tabla para poder visualizar los datos
                    self.usrTableView.reloadData()
                    
                    
                case .failure(let error):
                    print(error)
            }//END SC
        }//END Alamorife
    }
    
    
//MARK: Funciones tableView
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        190
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        rows
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "usrCell", for: indexPath) as! UserTableViewCell
        cell.selectionStyle = .none
        cell.usrIdLbl.text = String(usrsData![indexPath.row].id!)
        cell.usrEmailLbl.text = usrsData![indexPath.row].email!
        cell.usrNameLbl.text = usrsData![indexPath.row].firstName!
        cell.usrApLbl.text = usrsData![indexPath.row].lastName!


        
        return cell
    }
    

    
    
    



}
