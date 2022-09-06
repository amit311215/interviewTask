//
//  HomeVC.swift
//  InterviewTask
//
//  Created by Amit Gohel on 05/09/22.
//

import UIKit
import Alamofire
import Kingfisher
class HomeVC: UIViewController {

    @IBOutlet weak var filterView: UIView!{
        didSet{
            filterView.isHidden = true
        }
    }
    @IBOutlet weak var noDataView: UIView!{
        didSet{
            noDataView.isHidden = true
        }
    }
    @IBOutlet weak var tblCompanyInfo: UITableView!{
        didSet{
            tblCompanyInfo.delegate = self
            tblCompanyInfo.dataSource = self
        }
    }
    var itemCell = "CompanyDetailCell"
    var companyArr = [CompanyResponse]()
    
    var launchesCell = "LaunchesCell"
    var launchesArr = [LaunchesResponse]()
    var filterArr = [LaunchesResponse]()
    override func viewDidLoad() {
        super.viewDidLoad()
        companyArr.removeAll()
        filterView.layer.cornerRadius = 8
        let nib = UINib(nibName: itemCell, bundle: nil)
        tblCompanyInfo.register(nib, forCellReuseIdentifier: itemCell)
        
        let nib1 = UINib(nibName: launchesCell, bundle: nil)
        tblCompanyInfo.register(nib1, forCellReuseIdentifier: launchesCell)
        tblCompanyInfo.estimatedRowHeight = 100
        tblCompanyInfo.rowHeight = UITableView.automaticDimension
        getComapanyDataAPI()
        getAllLaunchesDataAPI()
    }
    func getComapanyDataAPI() {
        self.view.activityStartAnimating(activityColor: .black)
        let url = URL(string: "https://api.spacexdata.com/v4/company")
        AF.request(url!, parameters: nil, headers: nil).validate(statusCode: 200 ..< 299).responseData { response in
            switch response.result {
            case .success(let data):
                do {
                    let jsonData = try JSONDecoder().decode(CompanyResponse.self, from: response.data!)
                    print(jsonData)
                    self.companyArr.append(jsonData)
                    DispatchQueue.main.async {
                        self.tblCompanyInfo.reloadData()
                        self.view.activityStopAnimating()
                    }
                } catch {
                    print("Error:- \(error)")
                }
            case .failure(let error):
                print("Error:- \(error.localizedDescription)")
                
            }
        }
    }
    func getAllLaunchesDataAPI() {
        //self.view.activityStartAnimating(activityColor: .black)
        let url = URL(string: "https://api.spacexdata.com/v4/launches")
        AF.request(url!, parameters: nil, headers: nil).validate(statusCode: 200 ..< 299).responseData { response in
            switch response.result {
            case .success(let data):
                do {
                    let jsonData = try JSONDecoder().decode([LaunchesResponse].self, from: response.data!)
                    print(jsonData)
                    self.launchesArr = jsonData
                    DispatchQueue.main.async {
                        self.tblCompanyInfo.reloadData()
                       // self.view.activityStopAnimating()
                    }
                } catch {
                    print("Error:- \(error)")
                }
            case .failure(let error):
                print("Error:- \(error.localizedDescription)")
                
            }
        }
    }

    @IBAction func onTapToFilter(_ sender: Any) {
        filterView.isHidden = false
    }
    
    @IBAction func onTapToAcending(_ sender: Any) {
        filterView.isHidden = true
        filterArr = launchesArr.sorted(by: {$0.date_local ?? "" < $1.date_local ?? ""})
        launchesArr = filterArr
        print(launchesArr)
        tblCompanyInfo.reloadData()
        
    }
    
    @IBAction func onTapToDecending(_ sender: Any) {
        filterView.isHidden = true
        filterArr = launchesArr.sorted(by: {$0.date_local ?? "" > $1.date_local ?? ""})
        launchesArr = filterArr
        print(launchesArr)
        tblCompanyInfo.reloadData()
    }
}
extension HomeVC: UITableViewDelegate,UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        if section == 0{
            return "COMPANY"
        }else{
            return "LAUNCHES"
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0{
            if companyArr.count > 0{
                return companyArr.count
            }
        }
        if section == 1{
            if launchesArr.count > 0{
                noDataView.isHidden = true
                return launchesArr.count
            }else{
                noDataView.isHidden = false
            }
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0{
            let cell = tblCompanyInfo.dequeueReusableCell(withIdentifier: itemCell, for: indexPath) as! CompanyDetailCell
            let data = companyArr[indexPath.row]
            cell.selectionStyle = .none
            cell.lbCompanyName.text = "CompanyName :" + " " + (data.name ?? "SpaceX")
            cell.lbYear.text = "Year : \(data.founded ?? 2002)"
            cell.lbEmployees.text = "Employees : \(data.employees ?? 9500)"
            cell.lbFounderName.text = "FounderName :" + " " + (data.founder ?? "Elon Musk")
            cell.lbLunchSite.text = "Launch_site : \(data.launchSites ?? 3)"
            cell.lbValuation.text = "Valuation : \(data.valuation ?? 74000000000)"
            return cell
        }else{
            let cell = tblCompanyInfo.dequeueReusableCell(withIdentifier: launchesCell, for: indexPath) as! LaunchesCell
            let data = launchesArr[indexPath.row]
            cell.selectionStyle = .none
            cell.lbMissionName.text = "Mission :" + " " + (data.name ?? "")
            cell.lbDateTime.text = "Date/Time :" + " " + (data.date_utc ?? "")
            cell.lbRocket.text = "Rocket :" + " " + (data.rocket ?? "")
            cell.lbDays.text = "7"
            let imgUrl = URL(string: data.links?.patch?.small ?? "")
            cell.imgPatch.kf.setImage(with: imgUrl)
            
            if data.success == true{
                cell.imgLaunch.image = UIImage(named: "check")
            }else{
                cell.imgLaunch.image = UIImage(named: "wrong")
            }
            return cell
        }
        //return UITableViewCell()
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 1{
            if let url = URL(string: launchesArr[indexPath.row].links?.article ?? "") {
                UIApplication.shared.open(url)
            }
        }
        
    }
   
    
}

