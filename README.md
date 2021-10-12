# News-Portal-Project-WebScraping-PHP
Branch: **Aniruddha**

There are following directories here:  
  
	1. upload_php: this folder mainly contains the basic programs to upload images, and run programs through php.
		* upload.html: This file is a form to upload an image in database
		* upload_php: There should be a target directory uploads/ in the server. this code contains the program of uploading an image file on the server and also making the changes in the database.
		* tmp.php: This php file runs a shell script from php.
	
	2. APIs: this folder contains the apis explored for news scraping.
		* g_news.py: "GoogleNews" api. The image functionality is not working here.
		* news_api.py: "newsapi" api. This is a paid api. Free version have restrictions and gives restricted number of responses.
		* py_g_news.py: "pygooglenews" api. This api does not give the image link and description of the news article
		
	3. manual: wrote own webscraping program for extracting articles from google news.
		 * manual_under_dev.py: This file contains the main function which fetches google news data
		 * parse_class.py: This file contains the parser class created to parse and extract required data from the fetched google news page.
		 * typical_parse_data.py: This is a sample file showing the fetched google news data. Note that this is the unparsed data. This contains only one line with about 4lac characters. This has to be opened with vim. Gedit may crash on opening it.
		 * docs: This is a directory which contains documentation of the parser and main. Open the page _build/html/index.html to see documentation.
