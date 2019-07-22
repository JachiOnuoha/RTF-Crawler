// Property of the CodeBusters


import UIKit

var boldText: [String] = []
var centerText: [String] = []
var Headings: [String : Int] = [:]
var word:String? = nil
var text:String? = nil

//Opens Jack London File
if let rtfPath = Bundle.main.url(forResource: "jack_london", withExtension: "rtf") {
    do {
        // Finds all the sentences that are bold
        let attributedStringWithRtf: NSMutableAttributedString =
            try NSMutableAttributedString(url: rtfPath, options: [NSMutableAttributedString.DocumentReadingOptionKey.documentType:
                NSMutableAttributedString.DocumentType.rtf], documentAttributes: nil)
        attributedStringWithRtf.enumerateAttribute(.font, in: NSRange(0..<attributedStringWithRtf.length)) {
            value, range, stop in
            if let font = value as? UIFont {
                // make sure this font is actually bold
                if font.fontDescriptor.symbolicTraits.contains(.traitBold) {
                    // it's bold, so append it to the array named boldText
                    word = attributedStringWithRtf.attributedSubstring(from: range).string
                    boldText.append(word ?? "No bold Text")
                }
            }
            // Displays the text on the TextView
        }// end of bold check
        
        //Finds all the text that are center aligned in the document
        attributedStringWithRtf.enumerateAttribute(NSMutableAttributedString.Key.paragraphStyle, in: NSRange(0..<attributedStringWithRtf.length)) {
            value, range, stop in
            if let align = value as? NSParagraphStyle{
                if align.alignment == .center{
                    text = attributedStringWithRtf.attributedSubstring(from: range).string
                    // append center aligned text to array named centerText
                    centerText.append(text ?? "No centered text")
                }
            }
        }// end of center check
        
        
    }
        
    catch let error {
        print("Got an error \(error)")
    }
    
}
else{
    print("Not Found")
}

print(boldText) // Prints the list of all bold sentences
print(centerText) // Prints the list of all center aligned sentences

