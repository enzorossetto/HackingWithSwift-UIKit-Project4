//
//  TableViewController.swift
//  Project4
//
//  Created by Enzo Rossetto on 04/07/24.
//

import UIKit

class TableViewController: UITableViewController {
    let websites = ["apple.com", "hackingwithswift.com"]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Easy browser"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        websites.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Website", for: indexPath)
        cell.textLabel?.text = websites[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "Browser") as? BrowserViewController {
            vc.websites = websites
            vc.initialWebsite = websites[indexPath.row]
            navigationController?.pushViewController(vc, animated: true)
        }
    }
}
