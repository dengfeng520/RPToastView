//
//  ViewController.swift
//  RPToastViewDemo
//
//  Created by rp.wang on 2019/6/28.
//  Copyright © 2019 Beijing Physical Fitness Sport Science and Technology Co.,Ltd. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    var modeArray: [String] = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
 
        self.modeArray = ["onlyTextMode","indeterminateMode","mixedMode","loopMode","loopAndTextMode"]
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return 55
    }
}

extension ViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "ToastTableViewCellID")!
        
        cell.textLabel?.text = self.modeArray[indexPath.row]
        
        return cell
    }
   
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        switch indexPath.row {
        case 0:
            RPToastView.loading(Display())
            break
        case 1:
            var display = Display()
            display.mode = .indeterminateMode
            display.title = "test Loading..."
            display.isCustomize = true
            RPToastView.loading(display)
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 5) {
                RPToastView.hidden(animation: true)
            }
            break
        case 2:
            RPToastView.loading(Display(mode: .mixedMode, isView: self.view, title: "Loading...", dimBackground: false))
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 5) {
                RPToastView.hidden(animation: true)
            }
            break
        case 3:
            RPToastView.loading(Display(mode: .loopMode, isView: self.view))
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 5) {
                RPToastView.hidden(animation: true)
            }
            break
        case 4:
            var display = Display()
            display.mode = .loopAndTextMode
            display.title = "this is loop loading..."
            display.isCustomize = true
            display.bgColor = UIColor(red: 245.0/255.0, green: 190.0/255.0, blue: 98.0/255.0, alpha: 1)
            display.titleColor = .white
            display.outerLayer = UIColor(red: 200/255, green: 200/255, blue: 200/255, alpha: 1)
            display.innerLayer = .white
            RPToastView.loading(display)
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 5) {
                RPToastView.hidden(animation: true)
            }
            break
        default:
            break
        }
    }
    
}
