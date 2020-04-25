//
//  String+Extensions.swift
//  JGig
//
//  Created by Joacim Nidén on 2020-04-25.
//  Copyright © 2020 Joacim Nidén. All rights reserved.
//

import Foundation

extension String {

}

extension Optional where Wrapped == String {
  
  func getFormattedDateString() -> String? {
    let fromDateFormatter = DateFormatter()
    fromDateFormatter.dateFormat = "YYYY-MM-dd HH:mm:ss"
    
    let toDateFormatter = DateFormatter()
    toDateFormatter.dateFormat = "YYYY-MM-dd"
    
    if let string = self,
      let date = fromDateFormatter.date(from: string) {
      return toDateFormatter.string(from: date)
    } else {
      return nil
    }
  }
}
