#import libararies
from urllib.request import Request, urlopen
from bs4 import BeautifulSoup
import requests
import re
import sys
import parse_class as ps
import time

def parser_to_print(tmp):
	# result = text_data.split('"')[1::2]
	for i in soup.find_all('script')[17].text.split("["):
		print(i.split("]"))
	# for item in len(result):
	# tmp = ps.param_matcher(text_data)
	
	
	children_1 = tmp.children_l[0].children_l[0].children_l[0].children_l[1].children_l
	for i in range(0,len(children_1)):
		children_2 = children_1[i].children_l[0].children_l[1].children_l
		for j in range(0,len(children_2)):
			img_link = children_2[j].children_l[0].children_l[2].children_l[0].curr.split(",")[0][1:-1]
			url = children_2[j].children_l[0].curr.split(",")[7]
			title = children_2[j].children_l[0].curr.split(",")[3]
			title_desc = children_2[j].children_l[0].curr.split(",")[4]
			print(title, title_desc, img_link, url, sep="\t")
			print()
			print()
			print()

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
#print(soup.prettify())
#print("-----------------------------------")

#there are always 20 elements in the script tag
print(len(soup.find_all('script')))

#the 17th item in the script contains all the article related info
print(soup.find_all('script')[17].text)

#create a temporary object of the parse class
tmp = ps.param_matcher(str(soup.find_all('script')[17].text))

#print only the nested [] in the tmp file name
tmp.rem_brackets("tmp_"+key_word+"_rm_brackets_data.txt")

#print all the textual data prettily in the file
tmp.pretty_print("tmp_"+key_word+"_rm_pretty.txt")

time.sleep(5)
parser_to_print(tmp)