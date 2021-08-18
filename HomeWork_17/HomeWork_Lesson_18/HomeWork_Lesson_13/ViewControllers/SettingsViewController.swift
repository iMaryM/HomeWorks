//
//  SettingsViewController.swift
//  HomeWork_Lesson_13
//
//  Created by Мария Манжос on 31.07.21.
//

import UIKit

class SettingsViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var settings: [String] = ["Custom checker"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTable()

    }
    
    func setupTable() {
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(UINib(nibName: "SettingsTableViewCell", bundle: nil), forCellReuseIdentifier: "SettingsTableViewCell")
    }
    
    @IBAction func goToMainMenu(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
}

extension SettingsViewController: UITableViewDelegate {
    
}

extension SettingsViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return settings.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "SettingsTableViewCell") as? SettingsTableViewCell else {
            return UITableViewCell()
        }
        
        cell.setupSetting(setting: settings[indexPath.row])
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let customCheckersViewController = getViewController(from: "CustomChecker", and: "CustomCheckerViewController") as? CustomCheckerViewController else { return }
        navigationController?.pushViewController(customCheckersViewController, animated: true)
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
