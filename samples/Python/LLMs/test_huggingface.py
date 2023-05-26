from transformers import pipeline

'''
Reference:
    - https://juejin.cn/post/7234852669021831227
'''

def test_classifier():
    classifier = pipeline('sentiment-analysis')
    res = classifier('I like you very much!')
    print(res)

test_classifier()

def test_qa():
    qa = pipeline('question-answering')
    res = qa({
        # 正文：我是一个程序员，我从2022年开始写博客。
        'context': 'I am a programmer and have been writing blogs since 2022.',
        # 问题：我哪年开始写博客？
        'question': 'When do I start writing a blog?'
    })
    print(res)

test_qa()

