# News-Portal-Project-WebScraping-PHP
Template repository for CS699 course project.  
Aniruddha Branch

There are two directories here:  
  
	1. upload_php: this folder mainly contains the basic programs to upload images, and run programs through php.
		* upload.html: this file is a form to upload an image in database
		* upload_php: there should be a target directory uploads/ in the server. this code contains the program of uploading an image file on the server and also making the changes in the database.
		* tmp.php: this php file runs a shell script from php.
	
	2. APIs: this folder contains the apis explored for news scraping.
		* "GoogleNews" api. The image functionality is not working here.
		* "newsapi" api. This is a paid api. Free version have restrictions and gives restricted number of responses.
		* "pygooglenews" api. This api does not give the image link and description of the news article
		
	3. manual: wrote own webscraping program for extracting articles from google news.
		 * manual_under_dev.py: this file contains the main function which fetches google news data
		 * parse_class.py: this file contains the parser class created to parse and extract required data from the fetched google news page.
		 * typical_parse_data.py: this is a sample file showing the fetched google news data. Note that this is the unparsed data. This contains only one line with about 4lac characters. This has to be opened with vim. Gedit may crash on opening it.
