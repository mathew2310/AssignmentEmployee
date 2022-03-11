//
//  ViewController.swift
//  Employee
//
//  Created by admin on 26/02/2022.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {

   
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        getUsers()
    Employees()
        tableView.dataSource = self
    }
    
    struct Employee {
        var firstName: String
        var  lastName: String
        var age:  Int
        var company: String
        
    }
    func Employees () {
        
    let e1 = Employee(firstName: "Declan", lastName: "Rice", age: 23, company: "ITC")
    let e2 = Employee(firstName:"Cynthia", lastName:"Brown", age: 18, company: "ITC")
    let e3 = Employee(firstName: "Lionel", lastName: "Messi", age: 35, company: "ITC")
    let e4 = Employee(firstName:"Marcus", lastName:"Rashford", age:24, company:"ITC")
    let e5 = Employee(firstName: "Jadon", lastName: "Sancho", age: 20, company: "ITC")
    let e6 = Employee(firstName:"Harry", lastName:"Maguire", age:29, company: "ITC")
    let e7 = Employee(firstName: "Sharad", lastName: "Pun", age: 22, company: "ITC")
    let e8 = Employee(firstName:"Mason", lastName:"Greenwood", age:19, company: "ITC")
    let e9 = Employee(firstName: "Maria", lastName: "Alpha", age:23, company:"ITC")
    let e10 = Employee(firstName:"Julian", lastName:"Draxler", age:25, company: "ITC")
    employee = [e1,e2,e3,e4,e5,e6,e7,e8,e9,e10]
    
    }
    
    var employee: [Employee] = []
    
    var users: [User] = []
    
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return 10
    }
  

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)as! studentTableViewCell
        
        cell.firstName.text = "\(employee[indexPath.row].firstName)"
        cell.lastName.text = "\(employee[indexPath.row].lastName)"
        cell.age.text = "\(employee[indexPath.row].age)"
        cell.company.text = "\(employee[indexPath.row].company)"
        return cell
    }
    
    func getUsers(){
        let session = URLSession.shared
        
        let urlstr = "https://reqres.in/api/users"
        
        let url = URL(string: urlstr)!
        
        let datatask = session.dataTask(with: url) {data, responce, error in
            
            do{
                let decodedResponce = try JSONDecoder().decode(UserResponce.self, from: data!)
                
                self.users = decodedResponce.data
            }catch{
                
            }
            
        }
        datatask.resume()
    }

    }

