
let punctuation = ",.;!?，。！？"
let separators = CharacterSet(charactersIn: punctuation)
let text = "That's why we had a barrel like this down in our basement, filled with cans of food and water. When the nuclear attack came, we were supposed to go downstairs, hunker down, and eat out of that barrel. Today, the greatest risk of global catastrophe doesn't look like this. Instead, it looks like this, if anything, kills over 10 million people in the next few decades."

let result = text.components(separatedBy: separators)
print(result)