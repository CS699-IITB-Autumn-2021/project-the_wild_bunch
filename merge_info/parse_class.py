#import libraries
from urllib.request import Request, urlopen
from bs4 import BeautifulSoup
import requests
import re
import sys
import parse_class as ps
import time
import argparse
import json
import os
import imghdr
import sql_fill as sql_f

class param_matcher:
	"""
	This class is the node of a tree.
	Each node stores textual content and
	pointers to it's children.
	"""
	def __init__(self, list_str):
		"""Constructor of the class.
			Populates the articles in the tree
			Parameters
			----------
				list_str: This is the string made of
				nested brackets of [] with textual
				entries in the nested brackets
			Returns
			-------
			None
		"""
		#assign member variables to values
		self.curr = list_str
		
		#get the children indices
		self.child_list = self.children(list_str)
		
		#create a list of children pointers
		self.children_l = []
		
		#make children nodes and populate children
		for i in self.child_list:
			new_child=param_matcher(list_str[i[0]:i[1]+1])
			self.children_l.append(new_child)

	def populate_data(self):
		self.articles = []

		article_list = self.children_l[0].children_l[0].children_l[0].children_l[1].children_l
		#iterate through the appropriate children
		for i in range(0,len(article_list)):
			
			#index of the initial child in the sibling
			sibling = 3

			if i>2:##better	to avoid coverage news with different parse
				
				str_title = ""
				str_title_desc = ""
				str_url = ""
				str_img_url = ""

				##iterate through sibling until title is not finished with "
				while article_list[i].children_l[0].curr.split(",")[sibling][-1]!='"':
					
					#store the siblings
					str_title = str_title + article_list[i].children_l[0].curr.split(",")[sibling]
					
					sibling = sibling+1
				
				#store the final sibling
				str_title = str_title + article_list[i].children_l[0].curr.split(",")[sibling]
				str_title = str_title[1:-1]
				# print(str_title, end = "\t")


				##go to the next sibling
				sibling = sibling+1
				
				##iterate through sibling until title description is not finished with "
				while article_list[i].children_l[0].curr.split(",")[sibling][-1]!='"':
					
					str_title_desc = str_title_desc + article_list[i].children_l[0].curr.split(",")[sibling]
					
					sibling = sibling+1


				str_title_desc = str_title_desc + article_list[i].children_l[0].curr.split(",")[sibling]
				str_title_desc = str_title_desc[1:-1]
				# print(str_title_desc,end="\t")
				
				#go to the next sibling
				sibling = sibling+3
				
				#store the url of the news article
				str_url = str_url + article_list[i].children_l[0].curr.split(",")[sibling]
				str_url = str_url[1:-1]
				# print(str_url, end = "\t")

				#go to the next sibling
				sibling = sibling+2

				#store the url of the image of the news article
				str_img_url = str_img_url + article_list[i].children_l[0].curr.split(",")[sibling][3:]
				str_img_url = str_img_url[:-1]
				# print(str_img_url, end="\t")


				self.articles.append([str_title, str_title_desc, str_url, str_img_url])
				#pretty print
				print()
				print()
				print()



	def html_print(self):
		print("<table>")
		print("\t<tr>")
		print("\t\t<th>Title</th>")
		print("\t\t<th>Title Description</th>")
		print("\t\t<th>URL</th>")
		print("\t\t<th>Image URL</th>")
		print("\t</tr>")
		for i in self.articles:
			print("\t<tr>")
			print("\t\t<td>",i[0],"</td>")
			print("\t\t<td>",i[1],"</td>")
			print("\t\t<td>",i[2],"</td>")
			print("\t\t<td>",i[3],"</td>")
			print("\t</tr>")
		print("<table>")
	
	def populate_sql(self, num, category, author,print_html=0):
		
		all_articles = self.articles
		id = author
		if print_html==1:
			print("<table>")
			print("\t<tr>")
			print("\t\t<th>Title</th>")
			print("\t\t<th>Title Description</th>")
			print("\t\t<th>URL</th>")
			print("\t\t<th>Image URL</th>")
			print("\t\t<th>Actual_image</th>")
			print("\t</tr>")
		
		iter_article=0
		while iter_article < min(num,len(all_articles)):
			
			subject = all_articles[iter_article][0]
			description = str(all_articles[iter_article][1])+"<a href= \""+str(all_articles[iter_article][2])+"\">Read More</a>"
			try:
				response = requests.get(all_articles[iter_article][3])
			except:
				# print("HERE RESPONSE PROBLEM")
				iter_article = iter_article + 1
				num = num+1
				continue
			
			soup1 = BeautifulSoup(response.text,'html.parser')
			image = str(time.time())
			
			file = open("assets/upload/article/"+image, "wb")
			file.write(response.content)
			file.close()
			
			img_type = imghdr.what("assets/upload/article/"+image)
			img_final_name = "assets/upload/article/"+image+"."+str(img_type)
			os.rename("assets/upload/article/"+image,img_final_name)
			# img_loc.append(img_final_name)
			
			if print_html==1:
				print("\t<tr>")
				print("\t\t<td>",subject,"</td>")
				print("\t\t<td>",all_articles[iter_article][1],"</td>")
				print("\t\t<td>",description,"</td>")
				print("\t\t<td>",all_articles[iter_article][3],"</td>")
				print("\t\t<td><img src=",img_final_name, " style=\"width:500px;height:600px;\">","</td>",sep="")
				print("\t</tr>")
			
			subject = all_articles[iter_article][0]
			description = str(all_articles[iter_article][1])+"<a href= \""+str(all_articles[iter_article][2])+"\">Read More</a>"
			# image =img_loc[i].split("/")[-1]
			print("Trying to upload on database", img_final_name)
			try:
				swl_obj = sql_f("Animesh@98","cs699proj")
				swl_obj.send_email(subject,description)
				swl_obj.store_article(img_final_name, subject, category, description, id)
			except:
				print("UNABLE TO UPLOAD IN DATABASE")
			iter_article = iter_article+1
		
		
		if print_html==1:
			print("</table>")
			print("</html>")
		#print("img_type:", img_type)
		
		#return
		
		
			
			# #establishing connection to database to fetch the emails to send updates
			# connection = pymysql.connect(host="localhost",user="root",passwd="Animesh@98",database="cs699proj" )
			# cursor = connection.cursor()
			# cursor.execute("SELECT * FROM emails")
			# to = ["cs699project2021@gmail.com"]

			# for row in cursor.fetchall():
			# 	to.append(row[1])

			# #setting variables for sending mail updates to users
			# gmail_user = 'cs699project2021@gmail.com'
			# gmail_pwd = 'Cs699@project2021'
			# smtpserver = smtplib.SMTP("smtp.gmail.com", 587)
			# smtpserver.ehlo()
			# smtpserver.starttls()
			# smtpserver.ehlo
			# smtpserver.login(gmail_user, gmail_pwd)

			# #setting up the mail content
			# msg = '<h1>'+subject+'</h1>' + '<br>' + description

			# #Setup the MIME and sending the mail
			# message = MIMEMultipart()
			# message['From'] = gmail_user
			# message['To'] = ",".join(to)
			# message['Subject'] = 'New news article added to XYZ news portal. Have a look.'
			# message.attach(MIMEText(msg, 'html'))
			# text = message.as_string()
			# smtpserver.sendmail(gmail_user, to, text)
			# smtpserver.close()

			#storing news article in database
			# sql = """INSERT INTO article (`article_title_img`,`article_title`,`article_category`,`article_desc`,`admin_id`) VALUES (%s, %s, %s,%s, %s)"""
			# cursor.execute(sql, (image, subject, category, str(description), str(id)))
			# connection.commit()
			# connection.close()


		

		
	def pretty_print(self, file_name):
		"""Print pretty the textual contents as well
			as the brackets in nested order.
			Parameters
			----------
				file_name: the file name to write the pretty values
			Returns
			-------
				string: the string which is the pretty print in 
				the file
		"""
		#to_construct is the string to make to write to file
		#or to print
		to_construct = ""
		
		#keep count of number of tab characters
		tab_chars = 0
		is_prev = 0

		#keep parity of opened quotes
		quotes_open = 0

		#iterate throught the textual data
		for i in range(0,len(self.curr)):
			
			#if quotes are not open only then consider the brackets
			if quotes_open==0:

				#if current character is bracket open, then start a newline
				#and increase the tab characters
				if self.curr[i] == "[":
					to_construct = to_construct + "\n"
					for tabs in range(0,(tab_chars)):
						to_construct = to_construct + " "
					to_construct = to_construct + self.curr[i]
					tab_chars = tab_chars + 1
					is_prev = 0

				#if current character is bracket close, then finish the recent
				#bracket open and and dencreste the tab characters
				elif self.curr[i] == "]":
					if is_prev==0:
						to_construct = to_construct + self.curr[i]
						# to_construct = to_construct + "\n"
						tab_chars = tab_chars - 1
						is_prev=1
					else:
						tab_chars = tab_chars - 1
						to_construct = to_construct + "\n"
						for tabs in range(0,(tab_chars)):
							to_construct = to_construct + " "
						to_construct = to_construct + self.curr[i]
				
				#other wise this is a textual data
				else:
					to_construct = to_construct + self.curr[i]

			#if quotes are open then consider this as textual data
			else:
				to_construct = to_construct + self.curr[i]
			

			#if the current character is a quote, then appropriately
			#open or close quotes
			if 	self.curr[i] == '"':
				count_back_slash = 0
				index = i-1
				while(index!=0 and self.curr[index]=="\\"):
					
					count_back_slash = count_back_slash+1
					index = index - 1
				# if self.curr[i-1] !='\\':
				if count_back_slash%2==0:
					quotes_open = 1-quotes_open

		#write the textual data in the file
		with open(file_name, "w") as f:
			f.write(to_construct)
		

		return to_construct


	def rem_brackets(self, file_name):
		"""Print pretty only the
			brackets in nested order.
			Parameters
			----------
				file_name: the file name to write the pretty values
			Returns
			-------
				string: the string which is the pretty print in 
				the file
		"""
		
		#to_construct is the string to make to write to file
		#or to print
		to_construct = ""
		
		#keep count of number of tab characters
		tab_chars = 0
		is_prev = 0

		#keep parity of opened quotes
		quotes_open = 0

		#iterate throught the textual data
		for i in range(0,len(self.curr)):
			
			#if quotes are not open only then consider the brackets
			if quotes_open==0:
				
				#if current character is bracket open, then start a newline
				#and increase the tab characters
				if self.curr[i] == "[":
					to_construct = to_construct + "\n"
					for tabs in range(0,(tab_chars)):
						to_construct = to_construct + " "
					to_construct = to_construct + self.curr[i]
					tab_chars = tab_chars + 1
					is_prev = 0
				
				#if current character is bracket close, then finish the recent
				#bracket open and and dencrease the tab characters
				elif self.curr[i] == "]":
					if is_prev==0:
						to_construct = to_construct + self.curr[i]
						# to_construct = to_construct + "\n"
						tab_chars = tab_chars - 1
						is_prev=1
					else:
						tab_chars = tab_chars - 1
						to_construct = to_construct + "\n"
						for tabs in range(0,(tab_chars)):
							to_construct = to_construct + " "
						to_construct = to_construct + self.curr[i]
			
			#if the current character is a quote, then appropriately
			#open or close quotes
			if 	self.curr[i] == '"':
				count_back_slash = 0
				index = i-1
				while(index!=0 and self.curr[index]=="\\"):
					
					count_back_slash = count_back_slash+1
					index = index - 1
				# if self.curr[i-1] !='\\':
				if count_back_slash%2==0:
					quotes_open = 1-quotes_open

		#write the brackets only in the file			
		with open(file_name, "w") as f:
			f.write(to_construct)
		
		return to_construct
		
	def children(self, str_curr):
		"""Populate the children of current
			node
			Parameters
			----------
				str_curr: the current string
			Returns
			-------
				string: the list of locations
				in the str_curr to have nested
				blocks
		"""

		#initially this node has no children
		children = 0
		
		#keep the total count on number of nested brackets
		count_bracket = 0
		
		#keep a list of all locations of nested brackets,
		#opening and closing brackets
		bracket_loc_indices = []
		opening_closing_brackets = []
		children_location = []

		#keep the parity of open quotes
		quotes_open = 0
		
		#iterate through the current string to capture nested brackets
		for i in range(0,len(str_curr)):
			#print(i, str_curr[i], len(str_curr), count_bracket)

			#if quotes are not open only then consider the brackets
			if quotes_open==0:

				#if current character is bracket open, then start a child
				if str_curr[i]=="[":
					count_bracket = count_bracket+1
					opening_closing_brackets.append(i+1)
				
				#if current character is bracket close, then finish 
				# collecting the data of recent child
				
				elif str_curr[i] == "]":
					#increase bracket count and make children appropriately
					count_bracket = count_bracket-1
					opening_last_loc = opening_closing_brackets.pop()
					closing_last_loc = i-1
					bracket_loc_indices.append((opening_last_loc,closing_last_loc))

					#EXCEPTION to be handled
					if count_bracket<0:
						print("ERROR")
						exit()
					
					#Nested bracket structure completed
					if count_bracket == 0:
						children = children + 1
						children_location.append((opening_last_loc,closing_last_loc))
			
			#if the current character is a quote, then appropriately
			#open or close quotes
			#if count_bracket<0:
			if 	self.curr[i] == '"':
				count_back_slash = 0
				index = i-1
				while(index!=0 and self.curr[index]=="\\"):
					count_back_slash = count_back_slash+1
					index = index - 1
				# if self.curr[i-1] !='\\':
				if count_back_slash%2==0:
					quotes_open = 1-quotes_open
		
		return children_location



	def parser_to_print(self):
		"""This function prints the Title, Title Description, URL, Image Url
		separated by tab of news articles fetched.
		
		Parameters
		----------
		None
		
		Returns
		-------
		None
			
		"""

		#iterate through the appropriate children
		for i in range(0,len(self.children_l[0].children_l[0].children_l[0].children_l[1].children_l)):
			
			#index of the initial child in the sibling
			sibling = 3

			if i>2:##better	to avoid coverage news with different parse
				
				##iterate through sibling until title is not finished with "
				while self.children_l[0].children_l[0].children_l[0].children_l[1].children_l[i].children_l[0].curr.split(",")[sibling][-1]!='"':
					
					#print the siblings
					print(self.children_l[0].children_l[0].children_l[0].children_l[1].children_l[i].children_l[0].curr.split(",")[sibling], end="")
					sibling = sibling+1
				
				#print the final sibling
				print(self.children_l[0].children_l[0].children_l[0].children_l[1].children_l[i].children_l[0].curr.split(",")[sibling],end="\t")
				
				##go to the next sibling
				sibling = sibling+1
				
				##iterate through sibling until title description is not finished with "
				while self.children_l[0].children_l[0].children_l[0].children_l[1].children_l[i].children_l[0].curr.split(",")[sibling][-1]!='"':
					print(self.children_l[0].children_l[0].children_l[0].children_l[1].children_l[i].children_l[0].curr.split(",")[sibling], end="")
					sibling = sibling+1
				print(self.children_l[0].children_l[0].children_l[0].children_l[1].children_l[i].children_l[0].curr.split(",")[sibling],end="\t")
				
				#go to the next sibling
				sibling = sibling+3
				
				#print the url of the news article
				print(self.children_l[0].children_l[0].children_l[0].children_l[1].children_l[i].children_l[0].curr.split(",")[sibling],end="\t")
				
				#go to the next sibling
				sibling = sibling+2

				#print the url of the image of the news article
				print(self.children_l[0].children_l[0].children_l[0].children_l[1].children_l[i].children_l[0].curr.split(",")[sibling][3:],end="\t")
				
				#pretty print
				print()
				print()
				print()
