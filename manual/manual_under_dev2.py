from urllib.request import Request, urlopen
from bs4 import BeautifulSoup
import requests
import re
import sys

key_word = "Trump"
if len(sys.argv)>1:
	key_word=sys.argv[0]

root = "https://www.google.com/"
link = "https://www.google.com/search?source=lnms&tbm=nws&sa=X&ved=2ahUKEwjzl-DcvKzzAhXT7HMBHauVCjAQ_AUoAXoECAEQAw&q="+key_word+"&biw=1183&bih=611&dpr=1.1"

req = Request(link, headers={'User-Agent': 'Mozilla/5.0'})

webpage = urlopen(req).read()
# # print(webpage)


with requests.Session() as c:
	soup = BeautifulSoup(webpage, 'html5lib')
	print(soup.prettify())
	print("-----------------------------------")
	# for item in soup.find_all('div',class_='kCrYT'):
		
	# 	try:
	# 		print(item.a)
	# 		print(item.a['href'],item.a.find('div',class_="BNeawe vvjwJb AP7Wnd").text,sep='\t')
	# 	except:
	# 		# print("here:",item.a,(item.a.text),sep='\t')
	# 		# print("HERE:",item)
	# 		pass
	for i in soup.find_all('div',class_='kCrYT'):
		if (type(i.find('a')))!=type(None):
			# print(type(i.find('a')))
			print(i.find('a')['href'].split("/url?q=")[1], end="\t")
			# print(i)
			text_data_list = (re.split('\d+ hours ago . ', i.text))
			text_data = ""
			if len(text_data_list)==2:
				text_data=text_data_list[1]
			else:
				text_data=text_data_list[0]
			print(text_data)
			print("++++++++++++++++++++++++")
