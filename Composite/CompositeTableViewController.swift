//
//  CompositeTableViewController.swift
//  Composite
//
//  Created by Денис Баринов on 27.5.20.
//  Copyright © 2020 Денис Баринов. All rights reserved.
//

import UIKit

class CompositeTableViewController: UITableViewController {
    var compositeTask = CompositeTask(name: "root")
    var levelTaskIndex = 1

    @IBAction func levelBackTaskButton(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func addTaskButtonOnTap(_ sender: Any) {
        compositeTask.tasks.append(CompositeTask(name: "Task \(levelTaskIndex).\(compositeTask.tasks.count+1)"))
        tableView.reloadData()
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return compositeTask.tasks.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TaskCell", for: indexPath) as! CompositeCell
        cell.nameTaskLabel.text = compositeTask.tasks[indexPath.row].name
        cell.countTaskLabel.text = "\(compositeTask.tasks[indexPath.row].tasks.count)"
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "CompositeController") as! CompositeTableViewController
        vc.compositeTask = compositeTask.tasks[indexPath.row]
        vc.modalPresentationStyle = .fullScreen
        vc.modalTransitionStyle = .crossDissolve
        vc.levelTaskIndex = levelTaskIndex + 1
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
}
