from fastapi import FastAPI
from transformers import pipeline

app = FastAPI(title="超级模型开发能力平台")

question_answerer = pipeline('question-answering')
classifier = pipeline('sentiment-analysis')

@app.get("/sentiment", summary='情绪分析', tags=['NLP方向'])
def qa(text: str = None):
    result = classifier(text)
    result = result[0]['label'] # 解析结果，只要需要的
    return {"code": 200, "result": result}

@app.get("/qa", summary='文本问答', tags=['NLP方向'])
def qa(text: str = None, q_text: str = None):
    result = question_answerer({'question': q_text, 'context': text})
    result = result['answer'] # 解析结果，只要需要的
    return {"code": 200, "result": result}

if __name__ == '__main__':
    import uvicorn
    uvicorn.run("main:app", host='0.0.0.0', port=8000)
