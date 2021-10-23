import pymysql
import smtplib
from email.mime.multipart import MIMEMultipart
from email.mime.text import MIMEText

class sql_fill:
	def __init__(self,password,database_n):
		#establishing connection to database to fetch the emails to send updates
		self.connection = pymysql.connect(host="localhost",user="root",passwd=password,database=database_n)
		self.cursor = self.connection.cursor()
		return
	
	def __del__(self):
		connection.close()
		return
	
	def send_email(self,subject, description):
		cursor.execute("SELECT * FROM emails")
		to = ["cs699project2021@gmail.com"]

		for row in cursor.fetchall():
			to.append(row[1])

		#setting variables for sending mail updates to users
		gmail_user = 'cs699project2021@gmail.com'
		gmail_pwd = 'Cs699@project2021'
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
	
	def store_article(self, image, subject, category, description, id):
		#storing news article in database
		sql = """INSERT INTO article (`article_title_img`,`article_title`,`article_category`,`article_desc`,`admin_id`) VALUES (%s, %s, %s,%s, %s)"""
		cursor.execute(sql, (image, subject, category, str(description), str(id)))
		connection.commit()
