import spacy

text1 = "This is a English sentence."
text2 = "这是一个中文的句子，请进行分词处理。"
texts = [text1, text2]

# nlp = spacy.load("en_core_web_sm")

import zh_core_web_sm
nlp = zh_core_web_sm.load()

for text in texts:
    doc = nlp(text)
    print([(w.text, w.pos_) for w in doc])