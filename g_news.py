
import sys
from GoogleNews import GoogleNews

#create object
googlenews = GoogleNews()

#set language
googlenews = GoogleNews(lang='en')

#see if command line input word is passed or not
if len(sys.argv)>1:
	term = sys.argv[1]
else:
	#if no command line argument then use APPLE as word
	term = "APPLE"

googlenews.search(term)
# print(googlenews.results()[0])

for articles in googlenews.results():
	print(articles['title'],articles['desc'],articles['link'],sep='\t')
	#get texts here?
	
###image not working here, this is also given on their website
#https://pypi.org/project/GoogleNews/
