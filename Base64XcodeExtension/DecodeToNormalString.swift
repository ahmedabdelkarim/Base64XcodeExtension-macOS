//
//  DecodeToNormalString.swift
//  Base64XcodeExtension
//
//  Created by Ahmed Abdelkarim on 3/4/19.
//  Copyright © 2019 AhmedAbdelkarim. All rights reserved.
//

import Foundation
import XcodeKit

class DecodeToNormalString: NSObject, XCSourceEditorCommand {
    
    func perform(with invocation: XCSourceEditorCommandInvocation, completionHandler: @escaping (Error?) -> Void ) -> Void {
        // Implement your command here, invoking the completion handler when done. Pass it nil on success, and an NSError on failure.
        
        let selections = invocation.buffer.selections
        
        for selection in selections {
            let range = selection as! XCSourceTextRange
            let startLine = range.start.line
            let startColumn = range.start.column
            let endLine = range.end.line
            let endColumn = range.end.column
            
            if(startLine != endLine || startColumn >= endColumn) {
                continue
            }
            
            let lineText = invocation.buffer.lines[startLine] as! String
            let selectedText = String(lineText.prefix(endColumn).suffix(endColumn - startColumn))
            
            let data = Data(base64Encoded: selectedText)
            
            if(data == nil) {
                continue
            }
            
            let decodedString = String(data: data!, encoding: .utf8)
            
            let newText = "\(lineText.prefix(startColumn))\(decodedString!)\(lineText.suffix(lineText.count - endColumn))"
            
            invocation.buffer.lines[startLine] = newText
        }
        
        completionHandler(nil)
    }
}
