//
//  ViewController.swift
//  RPToastViewDemo
//
//  Created by rp.wang on 2019/6/28.
//  Copyright © 2019 西安乐推网络科技有限公司. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    var modeArray: Array<String>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
 
        self.modeArray = Array.init()
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
            RPToastView.show(mode: .onlyTextMode, isView:self.view, text: "Loading....")
            break
        case 1:
            RPToastView.show(mode: .indeterminateMode, isView:self.view)
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 5) {
                RPToastView.hidden(animation: true)
            }
            break
        case 2:
            RPToastView.show(mode: .mixedMode, isView:self.view, text: "Loading....")
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 5) {
                RPToastView.hidden(animation: true)
            }
            break
        case 3:
            RPToastView.show(mode: .loopMode, isView:self.view)
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 5) {
                RPToastView.hidden(animation: true)
            }
            break
        case 4:
            RPToastView.show(mode: .loopAndTextMode, isView:self.view, text: "Loading....")
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 5) {
                RPToastView.hidden(animation: true)
            }
            break
        default:
            break
        }
    }
    
}