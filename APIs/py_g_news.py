from pygooglenews import GoogleNews
import sys

#init object
gn  = GoogleNews()

#see if command line input word is passed or not
if len(sys.argv)>1:
	term = sys.argv[1]
else:
	#if no command line argument then use lockdown as word
	term = "lockdown"

#search for the term
search = gn.search(term)

#iterate through the articles searched.
for i in search['entries']:
	print(i['title'],i['link'],sep='\t')
	#print the title and link of the news articles

#no image link, no description
#ref=https://pypi.org/project/pygooglenews/#usecase
#https://feedparser.readthedocs.io/en/latest/
