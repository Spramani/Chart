//
//  ThirdViewController.swift
//  Chart
//
//  Created by shubh on 31/08/21.
//

import UIKit
import Charts

class ThirdViewController: UIViewController, ChartViewDelegate {
    var piechart = CandleStickChartView()
    override func viewDidLoad() {
        super.viewDidLoad()
        piechart.delegate = self
        
        // Do any additional setup after loading the view.
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        piechart.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height - 110)
        piechart.center = view.center
        view.addSubview(piechart)
        
        var entries = [CandleChartDataEntry]()
        
                for x in 0..<20{
                    if entries.count == 3 {
                        entries.append(CandleChartDataEntry(x: Double(x+3), shadowH: Double(x+9), shadowL: Double(x+6), open: Double(x+1), close: Double(x+2)))
                    }else{
                        entries.append(CandleChartDataEntry(x: Double(x+6), shadowH: Double(x+3), shadowL: Double(x+3), open: Double(x+1), close: Double(x+2)))
                    }
                    
                    entries.append(CandleChartDataEntry(x: Double(x+6), shadowH: Double(x+3), shadowL: Double(x+3), open: Double(x+1), close: Double(x+2)))
                    }
        
        let set = CandleChartDataSet(entries: entries)
        set.colors = ChartColorTemplates.joyful()
        let data = CandleChartData(dataSet: set)
        piechart.data = data
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
