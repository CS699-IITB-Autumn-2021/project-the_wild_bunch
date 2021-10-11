from newsapi import NewsApiClient
import sys
# Init
newsapi = NewsApiClient(api_key='b29a84ec447f48cfbc0fd00def991e69')

#see if command line input word is passed or not
if len(sys.argv)>1:
	term = sys.argv[1]
else:
	#if no command line argument then use bitcoin as word
	term = 'bitcoin'

#search from bbc news
all_articles = newsapi.get_everything(q=term, sources='bbc-news,the-verge', domains='bbc.co.uk,techcrunch.com',language='en',page=2)	

#print status of articles
print(all_articles['status'])

#print total number of results
print(all_articles['totalResults'])

#iterate through the returned articles
for i in all_articles['articles']:
	#print title description url and image url
	print(i['title'], i['description'] , i['url'],i['urlToImage'], sep='\t')
	
##this is paid! and gives restriced number of responses.
##ref:https://newsapi.org/docs/client-libraries/python
