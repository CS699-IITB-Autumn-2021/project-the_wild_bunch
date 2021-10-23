import requests
from bs4 import BeautifulSoup
import sys
import json
import pymysql
import time

url = sys.argv[1]
category = sys.argv[2]
id = sys.argv[3]
response = requests.get(url)
soup = BeautifulSoup(response.text,'html.parser')

description = soup.find("div", class_ = "articleBody").text.replace('\n', "<br>") + "<br><a href = '" + url + "'>Read More...</a>" 
while description.startswith("<br>"):
	description = description[4:]

image = soup.find("figure", class_ = "postImage").img["data-lazy-src"]
response = requests.get(image)
image = str(time.time()) + '.' + image.split('.')[-1].split('?')[0]
file = open("assets/upload/article/"+image, "wb")
file.write(response.content)
file.close()

connection = pymysql.connect(host="localhost",user="root",passwd="Animesh@98",database="cs699proj" )
cursor = connection.cursor()
sql = """INSERT INTO article (`article_title_img`,`article_title`,`article_category`,`article_desc`,`admin_id`) VALUES (%s, %s, %s,%s, %s)"""
cursor.execute(sql, (image, str(soup.body.h1.text.replace(u'\xa0','').strip()), sys.argv[2], str(description), str(id)))
connection.commit()
connection.close()


# print(sys.argv[1])
# print(data)

# data = {'foo':1, 'baz': 2}
# print(json.dumps(data))
