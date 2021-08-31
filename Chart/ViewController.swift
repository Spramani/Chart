//
//  ViewController.swift
//  Chart
//
//  Created by shubh on 31/08/21.
//

import UIKit
import Charts
class ViewController: UIViewController, ChartViewDelegate {
    
    var barChart = BarChartView()
    let randomDouble = Int.random(in: 1...20)
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        barChart.delegate = self
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        barChart.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height - 110)
        barChart.center = view.center
        view.addSubview(barChart)
        
        var entries = [BarChartDataEntry]()
        
        for x in 0..<20{
            entries.append(BarChartDataEntry(x: Double(x), y: Double(x)))
            }
        
        let set = BarChartDataSet(entries: entries)
        set.colors = ChartColorTemplates.joyful()
        let data = BarChartData(dataSet: set)
        barChart.data = data
    }

}

