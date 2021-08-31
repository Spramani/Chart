//
//  SecondViewController.swift
//  Chart
//
//  Created by shubh on 31/08/21.
//

import UIKit
import Charts

class SecondViewController: UIViewController, ChartViewDelegate {
    
    var linechart = LineChartView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        linechart.delegate = self
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        linechart.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height - 110)
        linechart.center = view.center
        view.addSubview(linechart)
        
        var entries = [ChartDataEntry]()
        
        for x in 0..<20{
            entries.append(ChartDataEntry(x: Double(x), y: Double(x)))
            }
        
        let set = LineChartDataSet(entries: entries)
        set.colors = ChartColorTemplates.joyful()
        let data = LineChartData(dataSet: set)
        linechart.data = data
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
