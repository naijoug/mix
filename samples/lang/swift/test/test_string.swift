
let strs = [
    "This is a English.",
    "这是中文",
    "这是一个💥，This is a 😈"
]

func test(_ str: String) {
    print("\n\(str)")
    let chars = Array(str)
    for char in chars {
        print("\(char) - \(MemoryLayout.size(ofValue: char)) - \(MemoryLayout.alignment(ofValue: char))")
    }
}

for str in strs {
    test(str)
}