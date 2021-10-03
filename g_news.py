
import sys
from GoogleNews import GoogleNews
googlenews = GoogleNews()
googlenews = GoogleNews(lang='en')

if len(sys.argv)>1:
	term = sys.argv[1]
else:
	term = "APPLE"

googlenews.search(term)
# print(googlenews.results()[0])

for articles in googlenews.results():
	print(articles['title'],articles['link'],articles['img'],sep='\t')

