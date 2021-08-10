//
//  ViewController.swift
//  HomeWork_Lesson_16
//
//  Created by Мария Манжос on 9.08.21.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var navigationBar: UINavigationItem!
    
    var colors: [Color] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "TableViewCell")
        
        colors = Color.createColors(count: 200)
        
        navigationBar.rightBarButtonItem = UIBarButtonItem(title: "Next", style: .plain, target: self, action: #selector(nextButtonAction(_:)))
    }
    
    @objc
    func  nextButtonAction(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "StudentsViewController")
        navigationController?.pushViewController(vc, animated: true)
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell") as? TableViewCell else{
            return UITableViewCell()
        }
        
        let colorCell = UIColor.random()
        let colorRGB = colorCell.getRGB()
        
        cell.labelCell.text = "RGB - (\(colorRGB.red), \(colorRGB.green), \(colorRGB.blue))"
        cell.labelCell.textAlignment = .center
        cell.labelCell.textColor = colorCell
        
        let colorRGBClass = colors[indexPath.row].color.getRGB()
        cell.labelCellWithClass.text = "\(colors[indexPath.row].nameOfColor) - RGB(\(colorRGBClass.red), \(colorRGBClass.green), \(colorRGBClass.blue))"
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return colors.count
    }
    
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
