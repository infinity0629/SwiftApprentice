import Cocoa
import RegexBuilder

//let fixedWithBoundaries = /\b[a-z]+[0-9]*\b|\b[a-z]*[0-9]+\b/

/*
 
 在正则表达式上右键选择 Rfactor -> Convert to Regex Builder
 
 */
let fixedWithBoundaries = Regex {
    ChoiceOf {
        Regex {
            Anchor.wordBoundary
            OneOrMore(("a"..."z"))
            ZeroOrMore(("0"..."9"))
            Anchor.wordBoundary
        }
        Regex {
            Anchor.wordBoundary
            ZeroOrMore(("a"..."z"))
            OneOrMore(("0"..."9"))
            Anchor.wordBoundary
        }
    }
}
