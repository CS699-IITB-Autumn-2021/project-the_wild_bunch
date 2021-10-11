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


#use beautiful soup
soup = BeautifulSoup(webpage, 'lxml')

#print formatted output
print(soup.prettify())
print("-----------------------------------")

for i in (soup.find_all('a',class_="DY5T1d RZIKme")):
 	print(i.text,root+i['href'][2:],sep="\t")
 	# print(i)
 	print()
	
	
