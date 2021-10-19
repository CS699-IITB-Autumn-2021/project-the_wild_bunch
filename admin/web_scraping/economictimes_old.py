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

extradiv = soup.find("div", {"class": "artText"}).find_all('div')
for i in extradiv:
    i.decompose()
description = soup.find("div", {"class": "artText"}).text.replace('\n','<br>') + "<br><a href='"+url+"'>Read More...</a>"


image = soup.figure.img['src']
response = requests.get(image)
image = str(time.time()) + '.' + image.split('.')[-1].split('?')[0]
file = open("assets/upload/article/"+image, "wb")
file.write(response.content)
file.close()

connection = pymysql.connect(host="localhost",user="root",passwd="Animesh@98",database="cs699proj" )
cursor = connection.cursor()
sql = """INSERT INTO article (`article_title_img`,`article_title`,`article_category`,`article_desc`,`admin_id`) VALUES (%s, %s, %s,%s, %s)"""
cursor.execute(sql, (image, str(soup.body.h1.text.strip()), sys.argv[2], str(description), str(id)))
connection.commit()
connection.close()


# print(sys.argv[1])
# print(data)

# data = {'foo':1, 'baz': 2}
# print(json.dumps(data))
