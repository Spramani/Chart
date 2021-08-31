//
//  ThirdViewController.swift
//  Chart
//
//  Created by shubh on 31/08/21.
//

import UIKit
import Charts
import Alamofire

class ThirdViewController: UIViewController, ChartViewDelegate {
    var piechart = CandleStickChartView()
    
    var modelss = [models]()
    var dc = [NSDictionary]()
    override func viewDidLoad() {
        super.viewDidLoad()
        piechart.delegate = self
        APi()
        // Do any additional setup after loading the view.
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        piechart.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height - 110)
        piechart.center = view.center
        view.addSubview(piechart)
        
        var entries = [CandleChartDataEntry]()
        
        var wel = 1.0
                for x in dc {
                    let height = (x["high"] as? Double) ?? 0.0
                    let low = (x["low"] as? Double) ?? 0.0
                    let closes = (x["close"] as? Double) ?? 0.0
                    let open = (x["open"] as? Double) ?? 0.0
                    
                    entries.append(CandleChartDataEntry(x: wel, shadowH: height, shadowL: low, open: open, close: closes))
                    wel += 1.0
                    }
                    
                   
        
        let set = CandleChartDataSet(entries: entries)
        set.colors = ChartColorTemplates.liberty()
        let data = CandleChartData(dataSet: set)
        piechart.data = data
    }
    
  
    
    func APi(){
        
        AF.request("http://api.marketstack.com/v1/eod?access_key=ddef9f7695d2fcdd2c23a7b5703f12ff&symbols=AAPL",method: .get,headers: nil).responseJSON{
            response in
            let value = response.value as? NSDictionary
            if let a = value?.value(forKey: "data") as? [NSDictionary]{
                self.dc = a
            }
            self.viewDidLayoutSubviews()
            
            print(self.dc)
        }
    }
}



struct models : Codable {
    let pagination : Pagination?
    let data : [Data]?

    enum CodingKeys: String, CodingKey {

        case pagination = "pagination"
        case data = "data"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        pagination = try values.decodeIfPresent(Pagination.self, forKey: .pagination)
        data = try values.decodeIfPresent([Data].self, forKey: .data)
    }

}

struct Pagination : Codable {
    let limit : Int?
    let offset : Int?
    let count : Int?
    let total : Int?

    enum CodingKeys: String, CodingKey {

        case limit = "limit"
        case offset = "offset"
        case count = "count"
        case total = "total"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        limit = try values.decodeIfPresent(Int.self, forKey: .limit)
        offset = try values.decodeIfPresent(Int.self, forKey: .offset)
        count = try values.decodeIfPresent(Int.self, forKey: .count)
        total = try values.decodeIfPresent(Int.self, forKey: .total)
    }

}

struct Data : Codable {
    let open : Double?
    let high : Double?
    let low : Double?
    let close : Double?
    let volume : Double?
    let adj_high : String?
    let adj_low : String?
    let adj_close : Double?
    let adj_open : String?
    let adj_volume : String?
    let split_factor : Double?
    let symbol : String?
    let exchange : String?
    let date : String?

    enum CodingKeys: String, CodingKey {

        case open = "open"
        case high = "high"
        case low = "low"
        case close = "close"
        case volume = "volume"
        case adj_high = "adj_high"
        case adj_low = "adj_low"
        case adj_close = "adj_close"
        case adj_open = "adj_open"
        case adj_volume = "adj_volume"
        case split_factor = "split_factor"
        case symbol = "symbol"
        case exchange = "exchange"
        case date = "date"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        open = try values.decodeIfPresent(Double.self, forKey: .open)
        high = try values.decodeIfPresent(Double.self, forKey: .high)
        low = try values.decodeIfPresent(Double.self, forKey: .low)
        close = try values.decodeIfPresent(Double.self, forKey: .close)
        volume = try values.decodeIfPresent(Double.self, forKey: .volume)
        adj_high = try values.decodeIfPresent(String.self, forKey: .adj_high)
        adj_low = try values.decodeIfPresent(String.self, forKey: .adj_low)
        adj_close = try values.decodeIfPresent(Double.self, forKey: .adj_close)
        adj_open = try values.decodeIfPresent(String.self, forKey: .adj_open)
        adj_volume = try values.decodeIfPresent(String.self, forKey: .adj_volume)
        split_factor = try values.decodeIfPresent(Double.self, forKey: .split_factor)
        symbol = try values.decodeIfPresent(String.self, forKey: .symbol)
        exchange = try values.decodeIfPresent(String.self, forKey: .exchange)
        date = try values.decodeIfPresent(String.self, forKey: .date)
    }

}



