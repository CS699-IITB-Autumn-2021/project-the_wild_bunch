# News-Portal-Project-WebScraping-PHP
Branch: **Aniruddha**

There are following directories here:  

  	1. APIs: this folder contains the apis explored for news scraping.
		* g_news.py: "GoogleNews" api. The image functionality is not working here.
		https://pypi.org/project/GoogleNews/
		
		* news_api.py: "newsapi" api. This is a paid api. Free version have restrictions and gives restricted number of responses.
		https://newsapi.org/docs/client-libraries/python
		
		* py_g_news.py: "pygooglenews" api. This api does not give the image link and description of the news article
		https://pypi.org/project/pygooglenews/#usecase
		https://feedparser.readthedocs.io/en/latest/

	2. upload_php: this folder mainly contains the basic programs to upload images, and run programs through php.
		* upload.html: This file is a form to upload an image in database
		* upload_php: There should be a target directory uploads/ in the server. this code contains the program of uploading an image file on the server and also making the changes in the database.
		* tmp.php: This php file runs a shell script from php.
	
	
		
	3. manual: wrote own webscraping program for extracting articles from google news.
		 * google_news_parser.py: This file contains the main function which fetches google news data
		 Can run the command "$python3 google_news_parser.py -h" to see the command line options it gives
		 * parse_class.py: This file contains the parser class created to parse, extract, and store in a tree structure the required data from the fetched google news page.
		 * typical_parse_data.txt: This is a sample file showing the fetched google news data. Note that this is the unparsed data. This contains only one line with about 4lakh characters. Characters include binaries as well. Most parsers may fail in parsing binary data. This has to be opened with vim. Gedit may crash on opening it.
		 * typical_pretty_parsing.txt: This is a sample file showing how the data looks like after parsing raw data from goole news. This data is stored in a tree structure.
		 * sql_fill.py: This file contains the sql_fill class, which contains methods to fill webscraped data into sql table, and construct and send emails to users who about new news updates.
		 * map.txt: This file contains the special mapping of characters used in the URL of the search bar. For example the second line is @ %40, it means that when @ is a part of the google search keyword it gets mapped to %40 in the URL. This file is used in google_news_parser.py to get the URL. Also, this filename can be taken as command line argument in google_news_parser.py. More about this is in "$python3 google_news_parser.py -h" option.
		 * docs: This is a directory which contains documentation of the parser, main and sql. Open the page _build/html/index.html to see documentation.
	
	4. merge_info: This directory contains information of merging the backend and front ends with each other.
	See the following steps to follow to run this on your machine. See Readme.txt in this directory. The instructions work only in the server where the project is hosted.
		* Download this merge_info directory in www/html/
		* Open terminal inside this directory
		* run the command "$chmod +x setup.sh" if setup.sh does not have executable permissions.
		* run "$./setup.sh" on terminal. This makes a python virtual environment in a directory named virt_env and then install the required packages
		* Then open index.html and enter the keyword, category, number of results, author in the text box.
		* Wait for few minutes. It will print a pretty table in html. Note that tmp.php uses the python libs and command from the python virtual environment.
	The files contained in this directory except the following files have definitions/names similar as in manual directory.
		* index.html: This file contains textbox for keywords and a form to submit the data and run webscraping python program on the background.
		* tmp.php: This file runs the python program.
		* Requirements.txt: This lists the requirements i.e. the python packages for the program to work.

	5. Webpage: This directory can be hosted directly (in some machines with appropriate libs), without running setup.sh.

	6.other_web_scraping_files: This directory contains the webscraping files specific for websites, Economic Times, India.com, News18 and The Hindu respectively. It also contains the whole webscraping documentation.
