import requests
from bs4 import BeautifulSoup
import sys
import json
import pymysql
import time
import re

url = sys.argv[1]
category = sys.argv[2]
id = sys.argv[3]
response = requests.get(url)
soup = BeautifulSoup(response.text,'html.parser')

description = ""
for i in soup.find("div", id = re.compile("^content-body-")).find_all("p") :
    description = description + i.text + "<br><br>"
description = description + "<a href='" + url + "'>Read More...</a>"


image = soup.picture.source["srcset"]
response = requests.get(image)
image = str(time.time()) + '_' + image.split('/')[-1]
file = open("assets/upload/article/"+image, "wb")
file.write(response.content)
file.close()

connection = pymysql.connect(host="localhost",user="root",passwd="Animesh@98",database="cs699proj" )
cursor = connection.cursor()
sql = """INSERT INTO article (`article_title_img`,`article_title`,`article_category`,`article_desc`,`admin_id`) VALUES (%s, %s, %s,%s, %s)"""
cursor.execute(sql, (image, str(soup.body.h1.text.replace("\n","").strip()), sys.argv[2], str(description), str(id)))
connection.commit()
connection.close()


# print(sys.argv[1])
# print(data)

# data = {'foo':1, 'baz': 2}
# print(json.dumps(data))
