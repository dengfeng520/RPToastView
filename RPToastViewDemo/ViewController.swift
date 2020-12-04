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
    
        modeArray = ["onlyTextMode","indeterminateMode","mixedMode","loopMode","loopAndTextMode","rotateMode","rotateAndTextMode"]
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableFooterView = UIView()
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
        return modeArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "ToastTableViewCellID")!
        
        cell.textLabel?.text = modeArray[indexPath.row]
        
        return cell
    }
   
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        switch indexPath.row {
        case 0:
            var display = Display()
            display.title = "test Loading..."
            RPToastView.loading(display)
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
            RPToastView.loading(Display(mode: .mixedMode, isView: self.view, title: "Loading..."))
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
            RPToastView.loading(Display(mode: .loopAndTextMode, isView: self.view))
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 5) {
                RPToastView.hidden(animation: true)
            }
            break
        case 5:
            RPToastView.loading(Display(mode: .rotateMode, isView: self.view))
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 5) {
                RPToastView.hidden(animation: true)
            }
            break
        case 6:
            RPToastView.loading(Display(mode: .rotateAndTextMode, isView: self.view))
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 5) {
                RPToastView.hidden(animation: true)
            }
            break
        default:
            
            break
        }
    }
    
}
