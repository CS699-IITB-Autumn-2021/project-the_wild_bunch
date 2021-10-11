#import libararies
from urllib.request import Request, urlopen
from bs4 import BeautifulSoup
import requests
import re
import sys

#default keyword is Trump
key_word = "Trump"

#use the keyword passed in commandline argument if any
if len(sys.argv)>1:
	key_word=sys.argv[0]

#the root link
root = "https://www.google.com/"

#the search link with keyword
link = "https://news.google.com/search?q="+key_word+"&hl=en-IN&gl=IN&ceid=IN:en"

#request for the link
req = Request(link, headers={'User-Agent': 'Mozilla/5.0'})

#add a print statement to have more interaction
print("opening url...", link)


#read the webpage
webpage = urlopen(req).read()

#add a print statement to have more interaction
print("opened url...complete")


# print(webpage)

#start session
with requests.Session() as c:
	
	#use beautiful soup
	soup = BeautifulSoup(webpage, 'html5lib')
	
	#print formatted output
	print(soup.prettify())
	print("-----------------------------------")
	
	#This div class kCrYT contains the title and the link of article
	for item in soup.find_all('div',class_='kCrYT'):
		#start a try block as there may be no entity <a> in the class
		try:
			
			#print the url whole tag
	 		print(item.a)
	 		
	 		#print the url link in the whole tag and the title of the article separated by tab
	 		print(item.a['href'],item.a.find('div',class_="BNeawe vvjwJb AP7Wnd").text,sep='\t')
	 		
	 		
		except:
	 		#if there is no div class or url then just print the tag
	 		print(":::",item.a,(item.a.text),sep='\t')
	 		print("~~~",item)
	 		pass
	
	print("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~")
	
