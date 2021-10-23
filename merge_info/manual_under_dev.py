#import libraries
from urllib.request import Request, urlopen
from bs4 import BeautifulSoup
import requests
import re
import sys
import parse_class as ps
import time
import argparse


def key_word_process(keyword, file_mapping):
	"""This is the process keyword function.
	It takes as input keyword which is the
	characters given by the user to search and
	file_mapping which is the name of the file
	which contains mapping from character into special
	characters. This function substitutes those characters
	with special characters with the same mapping.

	Parameters
	----------
	keyword: String
	file_mapping: String.

	Returns
	-------
	n_keyword: String
	"""
	words_mapping= {}
	with open(file_mapping) as f:
		for line in f:
			key = line[0]
			val = line.split()[-1]
			words_mapping[key] = val
	# print(words_mapping)
    # exit()
	n_keyword = ""
	for i in range(0,len(keyword)):
        # print(keyword[i], )
		if keyword[i] in words_mapping.keys():
			n_keyword = n_keyword + words_mapping[keyword[i]]
		else:
			n_keyword = n_keyword + keyword[i]
	return n_keyword

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
	
	

	#use the keyword passed in commandline argument if any
	# if len(sys.argv)>1:
	# 	key_word=sys.argv[1]
	parser = argparse.ArgumentParser()
	parser.add_argument("-k","--keyword",metavar="", required=False, help="Keyword to search")
	parser.add_argument("-f","--special_character_mapping",metavar="", required=False, help="File name of special characters")
	parser.add_argument("-c","--category",metavar="", required=False, help="News category")
	parser.add_argument("-n","--fetch_result",metavar="", required=False, help="Maximum number of results")
	
	args = parser.parse_args()

	file_mapping = "map.txt"
	if args.special_character_mapping:
		file_mapping = args.special_character_mapping
    
	#default keyword is Trump
	key_word = "Trump"
	if args.keyword:
		key_word = args.keyword

	key_word = key_word_process(key_word, file_mapping)

	#the root link
	root = "https://www.google.com/"

	#the search link with keyword
	link = "https://news.google.com/search?q="+key_word+"&hl=en-IN&gl=IN&ceid=IN:en"

	#request for the link
	#req = Request(link, headers={'User-Agent': 'Mozilla/5.0'})

	#add a print statement to have more interaction
	print("opening url...", link)
	
	source = requests.get(link).text
	soup = BeautifulSoup(source, 'lxml')

	#read the webpage
	#webpage = urlopen(req).read()

	#add a print statement to have more interaction
	print("opened url...complete")
	# print()
	# print()

	# print(webpage)


	#use beautiful soup
	#soup = BeautifulSoup(webpage, 'lxml')

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
	# article_obj.rem_brackets("tmp_"+key_word+"_rm_brackets_data.txt")

	#print all the textual data prettily in the file
	# article_obj.pretty_print("tmp_"+key_word+"_rm_pretty.txt")

	#time.sleep(5)
	article_obj.populate_data()
	#article_obj.html_print()
	
	category = "Misc"
	if args.category:
		category = args.category
	num = 10
	if args.fetch_result:
		num = int(args.fetch_result)
	article_obj.populate_sql(num, category)

if __name__ == "__main__":
	main()
