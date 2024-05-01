//
//  ConnectionSectionView.swift
//  SwiftUITeplate
//
//  Created by Levon Shaxbazyan on 01.05.24.
//

import SwiftUI

@available(iOS 16.0, *)
struct ConnectionSectionView: View {
    
    // MARK: - Constants
    
    enum Constants {
        static let airModeTitle = "Авиарежим"
        static let wifiTitle = "Wi-Fi"
        static let bluetoothTitle = "Bluetooth"
        static let cellularDataTitle = "Сотовая связь"
        static let hotspotModeTitle = "Режим модема"
        static let vpnTitle = "VPN"
        
        static let airplaneModeIcon = "airplane"
        static let wifilcon = "wifi"
        static let bluetoothIcon = "bluetooth"
        static let cellularDatalcon = "antenna.radiowaves.left.and.right"
        static let hotspotModeIcon = "personalhotspot"
        static let vpnIcon = "vpn"
        
        static let wifiOptions = ["Не подключено", "Home", "Guest"]
        static let bluetoothOptions = ["Вкл.", "Выкл."]
        static let cellularOptions: [String] = []
        static let hotspotModeOptions = [ "Выкл.", "Вкл."]
    }
    
    // MARK: - @State Private Properties

    @State private var airModeIsOn = false
    @State private var selectionWIFi = 0
    @State private var selectionBluetooth = 0
    @State private var selectionCellular = 0
    @State private var selectionHotSpot = 0
    @State private var vpnIsOn = false
    
    // MARK: - Body

    var body: some View {
        Section {
            ToggleView(
                isOn: airModeIsOn,
                title: Constants.airModeTitle,
                image: Image(systemName: Constants.airplaneModeIcon),
                iconColor: Color.orange
            )
            
            PickerView(
                selection: selectionWIFi,
                title: Constants.wifiTitle,
                options: Constants.wifiOptions,
                image: Image(systemName: Constants.wifilcon),
                iconColor: Color.blue
            )

            PickerView(
                selection: selectionBluetooth,
                title: Constants.bluetoothTitle,
                options: Constants.bluetoothOptions,
                image: Image(Constants.bluetoothIcon),
                iconColor: Color.blue
            )
            
            PickerView(
                selection: selectionCellular,
                title: Constants.cellularDataTitle,
                options: Constants.cellularOptions,
                image: Image(systemName: Constants.cellularDatalcon),
                iconColor: Color.green
            )
            
            PickerView(
                selection: selectionHotSpot,
                title: Constants.hotspotModeTitle,
                options: Constants.hotspotModeOptions, 
                image: Image(systemName: Constants.hotspotModeIcon),
                iconColor: Color.green
            )
            
            ToggleView(
                isOn: vpnIsOn,
                title: Constants.vpnTitle,
                image: Image(Constants.vpnIcon), 
                iconColor: Color.blue
            )
            
        }
    }
    
}

#Preview {
    ConnectionSectionView()
}
