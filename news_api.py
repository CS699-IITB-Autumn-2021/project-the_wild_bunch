from newsapi import NewsApiClient
import sys
# Init
newsapi = NewsApiClient(api_key='b29a84ec447f48cfbc0fd00def991e69')

# /v2/top-headlines
# top_headlines = newsapi.get_top_headlines(q='bitcoin',
#                                           sources='bbc-news,the-verge',
#                                           category='business',
#                                           language='en',
#                                           country='us')

# # /v2/everything
if len(sys.argv)>1:
	term = sys.argv[1]
else:
	term = 'bitcoin'

all_articles = newsapi.get_everything(q=term, sources='bbc-news,the-verge', domains='bbc.co.uk,techcrunch.com',language='en',page=2)	

# # /v2/top-headlines/sources
# sources = newsapi.get_sources()
print(all_articles['status'])
print(all_articles['totalResults'])
for i in all_articles['articles']:
	print(i['title'], i['description'] , i['url'],i['urlToImage'], sep='\t')
	
	
##ref:https://newsapi.org/docs/client-libraries/python
