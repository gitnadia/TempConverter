//
//  ViewController.swift
//  TempConverter
//
//  Created by nadezda.gura 
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var celsiusLabel: UILabel!
    @IBOutlet weak var convertedTLabel: UILabel!
    @IBOutlet weak var temperatureSegment: UISegmentedControl!
    @IBOutlet weak var slider: UISlider!{
        //setting values for slider
        didSet{
            slider.maximumValue = 100
            slider.minimumValue = 0
            slider.value = 0
        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        convertedTLabel.text = "32º F"
        // Do any additional setup after loading the view.
    }


    @IBAction func sliderValueChanged(_ sender: Any) {
        print("slider:", slider.value)
        updateTemLabelForSlider(value: slider.value)
    }
    
    @IBAction func segmentValueChanged(_ sender: Any) {
        updateTemLabelForSlider(value: slider.value)
    }
    
    func updateTemLabelForSlider(value:Float){
        let celciusTemp = Int(value)
        celsiusLabel.text = "\(celciusTemp) º C"
        
        var convertedTempString = ""
        switch temperatureSegment.selectedSegmentIndex {
        case 0:
            let fahrenheitTempString = String(format:"%.2F", convertTempeFrom(celsius: celciusTemp).fahrenheit)
            convertedTempString = fahrenheitTempString + "º F"
        default:
            let kelvinTempString = String(format:"%.2F", convertTempeFrom(celsius: celciusTemp).kelvin)
            convertedTempString = kelvinTempString + "º K"
        }
        
        convertedTLabel.text = convertedTempString
        
    }
    
    func convertTempeFrom(celsius: Int) -> (fahrenheit:Double, kelvin:Double) {
        let fahrenheit = (Double(celsius) * 9 / 5) + 32
        let kelvin = Double(celsius) + 273.15
        return (fahrenheit, kelvin)
    }
    
    }
    


