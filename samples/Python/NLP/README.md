## install

```sh
# activate virtual env
$ python -m venv .env
$ source .env/bin/activate

# install spaCy
pip install -U pip setuptools wheel
pip install -U spacy
# download trained pipelines
python -m spacy download en_core_web_sm # en
python -m spacy download zh_core_web_sm # zh
python -m spacy download ko_core_news_sm # ko
python -m spacy download ja_core_news_sm # ja
```