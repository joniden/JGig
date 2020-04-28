//
//  String+Extensions.swift
//  JGig
//
//  Created by Joacim Nidén on 2020-04-25.
//  Copyright © 2020 Joacim Nidén. All rights reserved.
//

import Foundation

extension String {
  
  func lowercaseContains(_ string: String) -> Bool {
    return self.lowercased().contains(string.lowercased())
  }
  
}

extension Optional where Wrapped == String {
  
  /// This fixes the wrong format of the date that comes from the API
  /// - Returns: Optional date string in format YYYY-MM-dd
  func getFormattedDateString() -> String? {
    let fromDateFormatter = DateFormatter()
    fromDateFormatter.dateFormat = "YYYY-MM-dd HH:mm:ss"
    
    let toDateFormatter = DateFormatter()
    toDateFormatter.dateFormat = "YYYY-MM-dd"
    
    guard let string = self, let date = fromDateFormatter.date(from: string) else {
      return nil
    }
    
    return toDateFormatter.string(from: date)
  }
}
