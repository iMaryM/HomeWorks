//
//  ViewController2.swift
//  HomeWork_Lesson_16
//
//  Created by Мария Манжос on 14.08.21.
//

import UIKit

class ViewController2: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var colors: [Color] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Table of Colors(Class)"
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Next", style: .plain, target: self, action: #selector(nextButtonAction(_:)))
        
        //отвечает за ячейку
        tableView.delegate = self
        //отвечает за данные в ячейке
        tableView.dataSource = self
        
        tableView.register(UINib(nibName: "TableViewCell2", bundle: nil), forCellReuseIdentifier: "TableViewCell2")
        
        for index in 0...200 {
            colors.append(Color(nameOfColor: "Color \(index)"))
        }
        
    }
    
    @objc
    func  nextButtonAction(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "StudentsViewController")
        navigationController?.pushViewController(vc, animated: true)
    }

}

extension ViewController2: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
}

extension ViewController2: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return colors.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell2") as? TableViewCell2 else {
            return UITableViewCell()
        }
        
        cell.labelColor.text = "\(colors[indexPath.row].nameOfColor) (\(colors[indexPath.row].red), \(colors[indexPath.row].green), \(colors[indexPath.row].blue))"
        cell.labelColor.textAlignment = .center
        cell.labelColor.textColor = colors[indexPath.row].color
        
        return cell
    }
    
}
