import requests
from bs4 import BeautifulSoup
# import json
import sys
import pymysql

url = sys.argv[1]
category = sys.argv[2]
response = requests.get(url)
soup = BeautifulSoup(response.text,'html.parser')

description = ""
for content in soup.body.article.find_all("p",class_=lambda x: x and x.startswith('story_para_'))[0:-1] :
    description = description + content.text.strip() + "<br>"
description = description + "<a href='" + url + "'>Read More</a>"

data = {
    'title' : str(soup.body.h1.text.strip()),
    'description' : str(description),
}

# connection = pymysql.connect(host="localhost",user="root",passwd="",database="cs699proj" )
# cursor = connection.cursor()
# sql = """INSERT INTO article (`article_title_img`,`article_title`,`article_category`,`article_desc`,`admin_id`) VALUES (%s, %s, %s,%s, %s)"""
# cursor.execute(sql, (url, str(soup.body.h1.text.strip()), sys.argv[2], str(description), (2)))
# connection.commit()
# connection.close()


# print(sys.argv[1])
# print(data)

# data = {'foo':1, 'baz': 2}
# print(json.dumps(data))