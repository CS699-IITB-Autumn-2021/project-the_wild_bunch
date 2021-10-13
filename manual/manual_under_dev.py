#import libraries
from urllib.request import Request, urlopen
from bs4 import BeautifulSoup
import requests
import re
import sys
import parse_class as ps
import time
def main():
	"""This is the main
	Get keyword to search, through
	command line. If no keyword
	is given, default is "Trump".
	Prints the Title, Title description
	, URL of article and URL of image
	tab separated on standard output.
	
	Parameters
	----------
	keyword (optional): Command line
	input parameter.

	Returns
	-------
	None
	"""
	
	#default keyword is Trump
	key_word = "Trump"

	#use the keyword passed in commandline argument if any
	if len(sys.argv)>1:
		key_word=sys.argv[1]

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
	print()
	print()

	# print(webpage)


	#use beautiful soup
	soup = BeautifulSoup(webpage, 'lxml')

	#print formatted output
	#print(soup.prettify())
	#print("-----------------------------------")

	#there are always 20 elements in the script tag
	# print(len(soup.find_all('script')))

	#the 17th item in the script contains all the article related info
	# print(soup.find_all('script')[17].text)

	#create a temporary object of the parse class
	article_obj = ps.param_matcher(str(soup.find_all('script')[17].text))

	#print only the nested [] in the tmp file name
	article_obj.rem_brackets("tmp_"+key_word+"_rm_brackets_data.txt")

	#print all the textual data prettily in the file
	article_obj.pretty_print("tmp_"+key_word+"_rm_pretty.txt")

	time.sleep(5)
	article_obj.parser_to_print()


if __name__ == "__main__":
	main()
