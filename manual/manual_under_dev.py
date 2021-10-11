#import libararies
from urllib.request import Request, urlopen
from bs4 import BeautifulSoup
import requests
import re
import sys
import parse_class as ps
import time


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


#use beautiful soup
soup = BeautifulSoup(webpage, 'lxml')

#print formatted output
print(soup.prettify())
print("-----------------------------------")

#use class DY5T1d RZIKme to get the title and link
for i in (soup.find_all('a',class_="DY5T1d RZIKme")):

 	#print the text and the url with tab separator
 	print(i.text,root+i['href'][2:],sep="\t")
 	# print(i)
 	print()

#there are always 20 elements in the script tag
print(len(soup.find_all('script')))

#the 17th item in the script contains all the article related info
print(soup.find_all('script')[17].text)

#create a temporary object of the parse class
tmp = ps.param_matcher(str(soup.find_all('script')[17].text))
