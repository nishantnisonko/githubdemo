//
//  SettingsViewController.swift
//  GithubDemo
//
//  Created by Nishanko, Nishant on 4/5/17.
//  Copyright © 2017 codepath. All rights reserved.
//

import UIKit



protocol SettingsDelegate: class {
    func saveSettings(picker: SettingsViewController, didSave settings: GithubRepoSearchSettings?)
}


class SettingsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate  {

    weak var delegate: SettingsDelegate?

    @IBOutlet weak var settingsTable: UITableView!
    var settings : GithubRepoSearchSettings!
    var sectionRowCount : [Int] = [1, 3]
    var sectionTitles : [String] = ["Stars", "Languages"]
    
    var sections: [Section] = SectionData().getSectionsFromData()

    override func viewDidLoad() {
        super.viewDidLoad()
        settingsTable.dataSource = self
        settingsTable.delegate = self

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func cancel(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
//         #warning Incomplete implementation, return the number of sections
        return sections.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return sections[section].items.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sections[section].heading
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SettingsStarViewCell", for: indexPath)
        
        // Configure the cell...
        cell.textLabel?.text = sections[indexPath.section].items[indexPath.row]
        
        return cell
    }


//    func settingsFromSelection() -> GithubRepoSearchSettings? {
//        let selectedIndex = colorsSegmentedControl.selectedSegmentIndex
//        if selectedIndex != UISegmentedControlNoSegment {
//            return colors[selectedIndex].1
//        }
//        return nil
//    }
    
//
//
//    @IBAction func save(_ sender: Any) {
//            //        delegate?.colorPicker(self, didSave: colorFromSelection())
//            
//    }
//    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
//        
//        return 2
//        
//    }
//
//    
//    
//    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        return sectionTitles[section]
//    }
//    
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        print( "count",sectionRowCount[section])
//        return sectionRowCount[section]
//    }
//    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        
//        var cell : UITableViewCell!
//        if(indexPath.row == 0){
//            cell = tableView.dequeueReusableCell(withIdentifier: "SettingsStarViewCell", for: indexPath as IndexPath)
//
//        }else{
//            cell = tableView.dequeueReusableCell(withIdentifier: "LanguageViewCell", for: indexPath as IndexPath)
//        }
//        
//        
//        print(indexPath.row, indexPath.section)
//        // Configure the cell...
//        
//        return cell
//        
//    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
