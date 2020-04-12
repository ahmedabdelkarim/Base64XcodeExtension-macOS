//
//  EncodeToBase64String.swift
//  Base64XcodeExtension
//
//  Created by Ahmed Abdelkarim on 3/4/19.
//  Copyright © 2019 AhmedAbdelkarim. All rights reserved.
//

import Foundation
import XcodeKit

class EncodeToBase64String: NSObject, XCSourceEditorCommand {
    
    func perform(with invocation: XCSourceEditorCommandInvocation, completionHandler: @escaping (Error?) -> Void ) -> Void {
        // Implement your command here, invoking the completion handler when done. Pass it nil on success, and an NSError on failure.
        
        // Retrieve the selections of the current source editor.
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
            
            let base64String = Data(selectedText.utf8).base64EncodedString()
            
            let newText = "\(lineText.prefix(startColumn))\(base64String)\(lineText.suffix(lineText.count - endColumn))"
            
            invocation.buffer.lines[startLine] = newText
        }
        
        completionHandler(nil)
    }
}
