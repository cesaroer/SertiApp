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
    var usrsAvatar: [UIImage] = []
    
    let transition = SlideInTransition()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        usrTableView.delegate = self
        usrTableView.dataSource = self
        
        getUsrList()

    }
    
//MARK: Actions Buttons
    
    @IBAction func menuBtnTapped(_ sender: Any) {
        guard let menuVC = storyboard?.instantiateViewController(withIdentifier: "menuVc") as? MenuViewController else {return}
        menuVC.didTapMenuType = { menuType in
            self.loggout(menuType)
        }
        menuVC.modalPresentationStyle = .overCurrentContext
        menuVC.transitioningDelegate = self
        
        present(menuVC, animated: true)
        
    }
    
//MARK: Funcion de transicion a Vista inicial para Loggout
    func loggout(_ menuType: MenuType) {
        switch menuType {
            case .logout:
                transitionToMain(contview: view)
            case .profile:
                performSegue(withIdentifier: "profileSegue", sender: AnyObject.self)
            default:
                print("No hay esta opcion")
        }
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
                        
                        //Si hay imagen para el usuario guardamos la imagen en un arreglo local para evitar pedir la imagen al servidor cada vez que se tenga que desplegar.
                        for i in 0..<self.rows{
                            let imageUsrURL = URL(string: self.usrsData![i].avatar!)
                            print("Esta es la url: para \(i) : \(imageUsrURL!)")
                            if let imageUsrsData = try? Data(contentsOf: imageUsrURL!){
                                print("__Se  supone que si hay Data___")
                                if let imageUsr = UIImage(data: imageUsrsData){
                                    print("__Se  supone que si hay Imagen___")
                                    self.usrsAvatar.append(imageUsr)
                                }else{
                                    print("Entramos al else___NOOOOO")
                                    self.usrsAvatar.append(UIImage(named: "logo-serti")!)
                                }
                            }
                        }
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
        //Se Asigna la imagen al imageView y se le da diseño redondeado
        cell.usrAvatarImageView.image = usrsAvatar[indexPath.row]
        cell.usrAvatarImageView?.layer.masksToBounds = true
        cell.usrAvatarImageView?.layer.cornerRadius = cell.usrAvatarImageView.frame.width / 2
        

        return cell
    }
}

extension HomeViewController: UIViewControllerTransitioningDelegate {
    
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transition.isPresenting = true
        return transition
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transition.isPresenting = false
        return transition
    }
}
