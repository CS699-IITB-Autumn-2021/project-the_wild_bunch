#inmporting libraries
import requests
from bs4 import BeautifulSoup
import sys
import json
import pymysql
import time
import smtplib
from email.mime.multipart import MIMEMultipart
from email.mime.text import MIMEText

#fetching arguements for news article from php
url = sys.argv[1]
category = sys.argv[2]
id = sys.argv[3]

#defining the parser
response = requests.get(url)
soup = BeautifulSoup(response.text,'html.parser')

#fetching the news article description using web scrapping
description = ""
for content in soup.body.article.find_all("p",class_=lambda x: x and x.startswith('story_para_'))[0:-1] :
    description = description + content.text.strip() + "<br><br>"
description = description + "<a href='" + url + "'>Read More</a>"

#fetching news article image and storing in local directory
image = soup.body.figure.find_all("img")[1]['src']
response = requests.get(image)
image = str(time.time()) + '.' + image.split('.')[-1].split('?')[0]
file = open("assets/upload/article/"+image, "wb")
file.write(response.content)
file.close()

#establishing connection to database to fetch the emails to send updates
connection = pymysql.connect(host="localhost",user="root",passwd="Animesh@98",database="cs699proj" )
cursor = connection.cursor()
cursor.execute("SELECT * FROM emails")
to = ["cs699project2021@gmail.com"]

for row in cursor.fetchall():
    to.append(row[1])

#setting variables for sending mail updates to users
gmail_user = 'cs699project2021@gmail.com'
gmail_pwd = 'Cs699@project2021'
subject = str(soup.body.h1.text.strip())
smtpserver = smtplib.SMTP("smtp.gmail.com", 587)
smtpserver.ehlo()
smtpserver.starttls()
smtpserver.ehlo
smtpserver.login(gmail_user, gmail_pwd)

#setting up the mail content
msg = '<h1>'+subject+'</h1>' + '<br>' + description

#Setup the MIME and sending the mail
message = MIMEMultipart()
message['From'] = gmail_user
message['To'] = ",".join(to)
message['Subject'] = 'New news article added to XYZ news portal. Have a look.'
message.attach(MIMEText(msg, 'html'))
text = message.as_string()
smtpserver.sendmail(gmail_user, to, text)
smtpserver.close()

#storing news article in database
sql = """INSERT INTO article (`article_title_img`,`article_title`,`article_category`,`article_desc`,`admin_id`) VALUES (%s, %s, %s,%s, %s)"""
cursor.execute(sql, (image, str(soup.body.h1.text.strip()), category, str(description), str(id)))
connection.commit()
connection.close()
