//
//  HomeViewController.swift
//  iMeteo
//
//  Created by lucas on 22/12/2018.
//  Copyright © 2018 lucas. All rights reserved.
//

import UIKit
import MapKit
import Alamofire

class HomeViewController: UIViewController, UITableViewDelegate,UITableViewDataSource {
    @IBOutlet weak var nomVilleLbl: UILabel!
    @IBOutlet weak var temperatureLbl: UILabel!
    @IBOutlet weak var descLbl: UILabel!
    @IBOutlet weak var iconImage: UIImageView!
    @IBOutlet weak var tableView: UITableView!
    var isload : Bool = false
    var colorDay = UIColor(red: 0, green: 191 / 255, blue: 1, alpha: 1)
    var coloNitgth = UIColor(red: 19 / 255, green: 24 / 255, blue: 98 / 255, alpha: 1)
    
    var locationManager : CLLocationManager?
    private var previsions = [Prevision]()
    private var previsionJournaliers = [Journalier]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        updateLocation()
    }
    func loadPrevision(lat : Double, long: Double) {
        isload = true
        let baseURL = "http://api.openweathermap.org/data/2.5/forecast?"
        let latitude = "lat="+String(lat)
        let longitude = "&lon="+String(long)
        let uniteLng = "&units=metric&lang=fr"
        let key = "&APPID="+API
        let urlString = baseURL+latitude+longitude+uniteLng+key
        guard let url = URL(string : urlString) else { return }
        Alamofire.request(url).responseJSON { (response) in
            if let responses = response.value as? [String: AnyObject]{
                if let city = responses["city"] as? [String: AnyObject]{
                    if let maVille = city["name"] as? String{
                        self.nomVilleLbl.text = maVille
                        if let list = responses["list"] as? NSArray{
                            for element in list {
                                if let dict = element as? [String: AnyObject]{
                                    if let main = dict["main"] as? [String: AnyObject]{
                                        if let temp = main["temp"] as? Double{
                                            if let wathear = dict["weather"] as? NSArray, wathear.count > 0{
                                                if let tempActuel = wathear[0] as? [String: AnyObject]{
                                                    if let desc = tempActuel["description"] as? String {
                                                        if let icone = tempActuel["icon"] as? String {
                                                            if let date = dict["dt_txt"] as? String {
                                                                let prevision = Prevision(temp: temp, date: date, icon: icone, desc: desc)
                                                                self.previsions.append(prevision)
                                                                
                                                            }
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                         self.initValue()
                         self.initValueDay()
                        }
                    }
                }
            }
        }
    }
    func initValue() {
        if previsions.count > 0 {
            let prevision = previsions[0]
            temperatureLbl.text = prevision.getTemperature().convertDoubleToString()
            descLbl.text = prevision.getDesc()
            LocalService.loadImage(prevision.getIcone(), imageView: iconImage)
            if prevision.getIcone().contains("d"){
                view.backgroundColor = colorDay
            }else {
                view.backgroundColor = coloNitgth
            }
        }
    }
    func initValueDay() {
        var jour = ""
        var icon = ""
        var max = 0.0
        var min = 0.0
        var desc = ""
        for prevision in previsions {
            if  prevision.getJour() != "" {
                if prevision.getJour() != jour{
                    if jour != ""{
                        let journalier = Journalier(jour: jour, icone: icon, max: max, min: min, desc: desc)
                        previsionJournaliers.append(journalier)
                    }
                }
              jour = prevision.getJour()
              icon = prevision.getIcone()
              max = prevision.getTemperature()
              min = prevision.getTemperature()
              desc = prevision.getDesc()
            }else {
                if prevision.getTemperature() > max {
                    max = prevision.getTemperature()
                }
                if prevision.getTemperature() < min {
                    min = prevision.getTemperature()
                }
                if prevision.getDate().contains("12:"){
                    icon = prevision.getIcone()
                    desc = prevision.getDesc()
                }
            }
            
        }
         isload = false
         self.tableView.reloadData()
       
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return previsionJournaliers.count + 1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "previsionCell", for: indexPath) as! PrevisionCell
            cell.initView(previsions: previsions)
            return cell
        }else {
            let journalier = previsionJournaliers[indexPath.row - 1]
            let cell = tableView.dequeueReusableCell(withIdentifier: "jourCell", for: indexPath) as! JourCell
            cell.setupView(journalier: journalier)
            return cell
        }
        return UITableViewCell()
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 160
        }
        return 100
    }
}
