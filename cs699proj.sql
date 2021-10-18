-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Oct 18, 2021 at 05:32 PM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 8.0.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cs699proj`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `admin_id` int(11) NOT NULL,
  `admin_name` varchar(30) NOT NULL,
  `admin_email` varchar(30) NOT NULL,
  `admin_password` varchar(30) NOT NULL,
  `admin_status` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`admin_id`, `admin_name`, `admin_email`, `admin_password`, `admin_status`) VALUES
(1, 'admin', 'admin@admin.com', 'admin@1234', 1),
(2, 'kamal', 'kkakadiya153@gmail.com', 'kamal@1234', 1),
(3, 'darshan', 'darshan@gmail.com', '123456789', 1),
(6, 'demo@demo.com', 'demo@demo.com', 'demo@demo.com', 1),
(8, 'demo@demo.com', 'demo@demo.com', 'demo@demo.com', 0),
(9, 'demo@demo.com', 'demo@demo.com', 'demo@demo.com', 1),
(11, 'demo@demo.com', 'demo@demo.com', 'demo@demo.com', 0),
(13, 'demo@demo.com10', 'demo@demo.com', 'demo@demo.com', 0),
(16, 'parth', 'parthkaka@bscfh.fcbhjc', 'parthkaka', 1),
(18, 'parthkakadiya', 'parthkakadiya@gmail.com', 'parth@1234', 1),
(19, 'demnnc', 'ndcmg@nhknm.ngv', 'ndcmg@nhknm.ngv', 1),
(21, 'kamal153', 'kkakadiya153@gmail.com', 'kamal153', 1);

-- --------------------------------------------------------

--
-- Table structure for table `article`
--

CREATE TABLE `article` (
  `article_id` int(11) NOT NULL,
  `article_title_img` text NOT NULL,
  `article_title` text NOT NULL,
  `article_category` text NOT NULL,
  `article_desc` text NOT NULL,
  `article_visit` int(11) NOT NULL DEFAULT 0,
  `article_like` int(11) NOT NULL DEFAULT 0,
  `article_dislike` int(11) NOT NULL DEFAULT 0,
  `admin_id` int(11) NOT NULL,
  `article_img1` text DEFAULT '',
  `article_img2` text DEFAULT '',
  `article_img3` text DEFAULT '',
  `article_status` int(11) NOT NULL DEFAULT 1,
  `article_date` date NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `article`
--

INSERT INTO `article` (`article_id`, `article_title_img`, `article_title`, `article_category`, `article_desc`, `article_visit`, `article_like`, `article_dislike`, `admin_id`, `article_img1`, `article_img2`, `article_img3`, `article_status`, `article_date`) VALUES
(1, '1634364923220_96_AAPmDSD.img.jpeg', 'Maharashtra Bandh LIVE Updates: Reports of Shops Being Shut Forcibly Trigger War of Words Between BJP, Uddhav Govt; Local Trains on Time', 'India', 'Maharashtra Bandh Today LIVE Updates: Bus services were affected in Mumbai and neighbouring areas today and most of the shops and commercial establishments remained closed in the wake of the bandh called across Maharashtra by three partners in the Maha Vikas Aghadi (MVA) government to protest the killing of four farmers in Uttar Pradesh’s Lakhimpur Kheri district. As buses of the Brihanmumbai Electric Supply and Transport (BEST- the transport undertaking of the city civic body) and many of the traditional ‘black-yellow cabs’ remained off roads, there were huge crowds on suburban railway stations to commute by local trains, which were running as per schedule. The three partners in the MVA government in Maharashtra have appealed to the people to wholeheartedly support Monday’s state-wide bandh. The workers of Shiv Sena, NCP and Congress are meeting citizens with an appeal to participate in the bandh wholeheartedly and express their solidarity with farmers, he said.\r\n<br><br>\r\nSeveral trade organisations in Pune have expressed support for Monday’s Maharashtra bandh called by the ruling MVA constituents and other outfits to protest against the October 3 killing of farmers in Lakhimpur Kheri in Uttar Pradesh.\r\n<br><br>\r\nMumbai Police has said that strict patrolling will be held in view of statewide bandh. “Striking reserves to be deployed at strategic points, with 3 companies of SRPF, 500 Home Guards and 700 men from Local Arms units,” said the cops.', 20, 0, 0, 1, '', '', '', 1, '2021-10-18'),
(2, '1633944192795_95_islamic-state-16316975303x2.webp', '\'Those at Serena Should Leave Immediately\': US, UK Warn Citizens of ISIS Threat to Kabul Hotels', 'World', 'New Delhi: Issuing a fresh travel advisory, the United States and Britain have advised their citizens to stay away from hotels in the Afghan capital Kabul, particularly from Serena, a luxury hotel that had been the target of attacks by the Taliban in the past. “US citizens who are at or near the Serena Hotel should leave immediately,” the US State Department said, citing ‘security threats’ in the area.Also Read - New Covid Travel Rules in UK from Today. What it Means For Travellers From India?\r\n<br><br>\r\nBritain’s Foreign, Commonwealth and Development Office on the other hand stated,”In light of the increased risks you are advised not to stay in hotels, particularly in Kabul (such as the Serena Hotel). Also Read - Viral Video: ‘Dancing Dad’ Ricky Pond Performs Garba With His Kids, Grooves to \'Chogada\' to Celebrate Navratri | Watch\r\n<br><br>\r\nSince the Taliban, a hardline Islamist group seized control of Afghanistan, the US and other foreign citizens have left Afghanistan but some journalists still residing in the capital owing to their work. Also Read - Afghanistan Preparing to Participate in T20 World Cup: ICC Acting CEO Geoff Allardice\r\n<br><br>\r\nThe advisories by US and Britain come days after the suicide bombing at a mosque in Afghanistan’s Kunduz province. Local security officials said over 300 hundred people were at the mosque during the time of the blast. Witnesses had said over 100 worshippers were killed and wounded in the attack.\r\n<br><br>\r\nThe deadly blast the Shia mosque has received widespread condemnation. UN Secretary-General Antonio Guterres strongly condemned the “horrific” attack, saying: “Attacks that deliberately target civilians exercising the right to freely practice their religion are violations of fundamental human rights and international humanitarian law… The perpetrators must be brought to justice.”\r\n<br><br>\r\nThe Afghanistan Independent Human Rights Commission (AIHRC) called the attack against human rights values, saying it was a continued sting of deliberately targeting the country’s Hazara and Shia community.', 14, 0, 0, 1, '', '', '', 1, '2021-10-18'),
(3, '1633944334915_76_apple-ipad-mini-6-review-16336958143x2.webp', 'Apple iPad Mini 6 (2021) Review: A Near-Perfect Tablet That Fills a Market Gap', 'Tech', 'I have often been confused about owning an iPad. Back when the first generation iPad Pro was released, I was excited about the prospect of a slim tablet replacing my rather bulky work laptop. In about a year that I used it, I tried to overlook its flaws for the benefits, but software wise, tablets just weren’t ready to replace a full-scale desktop OS. Since then, a lot has changed – the world has seen a pandemic, Cristiano Ronaldo has returned to Manchester United, and I have come to realise that my perspective towards tablets might have been skewered. The latter, in large part, has happened in the past two weeks, thanks to the Apple iPad Mini 6, or iPad Mini 2021 – whatever you’d like to call it.\r\n<br><br>\r\nThe iPad Mini 6 is a balance of screen size, form factor and portability, an important formula that frequent travellers would prioritise once the pandemic recedes. It has also made me realise that the purpose of a tablet is not just to replace a laptop, but fill its absence. Before you jump to conclusions, I also believe that Apple should have made a keyboard for the iPad Mini 6 to fill the laptop’s absence better, but once you start spending time with it, you’d realise that this does you more good than bad. Here’s why.\r\n<br><br>\r\nFORM FACTOR AND PORTABILITY: ALMOST POCKETABLE\r\nTo state that the iPad Mini 6 is compact is to state the obvious – it is, after all, from the ‘Mini’ family of Apple’s hardware. You get an 8.3-inch display on a tablet that is 7.7 inches in height, and 5.3 inches in width. It is also 6.3mm thick, and weighs 297 grams for the cellular version, which is what we have with us. In comparison, the new Apple iPhone 13 Pro is 7.7mm thick and weighs 205 grams. The latter feels heavier in-hand because on the iPad, the weight is not proportionately higher, and is better distributed too.\r\nAll of this makes the iPad Mini 6 one of the easiest to carry, and you can stow it anywhere in your bag without worrying. It is easy to grip and operate with one hand, especially with an Apple Smart Folio cover slapped on. On desks, the iPad Mini 6 is a good second display to add to compact laptops without it taking up a lot of space, helping you to avoid switching between windows and tabs constantly, when writing. This actually helps reduce distractions, and its compact footprint means it’s great for small or loaded desks.\r\n', 15, 0, 0, 1, '', '', '', 1, '2021-10-18'),
(4, '1633944492486_92_morgan-kohli-1600-ipl-16338705743x2.webp', 'IPL 2021 Eliminator, RCB vs KKR Preview: Battle of Two Captains as Royal Challengers Bangalore Take on Kolkata Knight Riders', 'Sports', 'It will be a test of Virat Kohli’s tactical acumen against the ice-cool demeanour of Eoin Morgan when perennial underachievers Royal Challengers Bangalore clash with former champions Kolkata Knight Riders in the IPL Eliminator in Sharjah on Monday. Kohli, who has decided to step down from captaincy after this edition, has led RCB to the finals in 2016 besides reaching the play-offs twice in 2015 and 2020, and he would like to end things on a high in his last hurrah as captain.<br>For Morgan, it is about regaining the lost glory for KKR, a team which achieved great success under Gautam Gambhir, who had led them to two IPL titles in a space of three years in 2012 and 2014. On paper, it would be a battle between two evenly-poised teams, but overall, KKR has a slight edge, having won 15 out of 28 matches they played over the years.<br><br>But past records will count for little and it will boil down to winning small moments in the match, something which Kohli and Morgan would know pretty well. Both the captains have enough ammunition in their disposal and it will be all about managing the resources.', 14, 0, 0, 1, '', '', '', 1, '2021-10-18'),
(6, '1634364875974_26_53fb575a-2bfe-11ec-a8a7-28039111faee_1634113297584.jpeg', 'All new coal power plants should be halted to achieve net-zero emissions', 'India', 'Construction of all new coal-fired power plants will have to be halted as of this year and 40% of the existing global coal power fleet retired by 2030 if the world has to keep global warming under 1.5 degrees C, the International Energy Agency (IEA) has said. The IEA’s first World Energy Outlook released on Wednesday includes a scenario for the global transition to net-zero emissions by 2050. To achieve the scenario, approval of new oil and gas fields, coal mines, or mine extensions will also have to be stopped. Additionally, no new LNG export projects are to be developed, said Oil Change International, an advocacy organisation on the impact of fossil fuels, in an analysis of the IEA report.\r\n<br><br>\r\nThe report said the energy intensity of the global economy needs to decrease by 4% annually this decade. It added global clean energy investment needs to more than triple by 2030, with 85% of total energy investment directed towards clean technologies.\r\n<br><br>\r\nIEA said getting the world on track for 1.5 degrees C requires a surge in annual investment in clean energy projects and infrastructure to nearly $4 trillion by 2030. It added fossil fuel-related methane emissions need to be reduced by 75% by 2030. The report said the electricity sector needs to almost decarbonise by 2035 in developed nations and by 2040 in all countries. The sales of new internal combustion engine cars need to end by 2035 globally, it added.', 12, 0, 0, 1, '', '', '', 1, '2021-10-18'),
(7, '1634364830839_78_AAPwdLX.img.jpeg', 'US FDA advisers weigh case for booster shots of Moderna Covid-19 vaccine', 'World', 'Israel health officials on Thursday said booster doses of the Pfizer-BioNTech Covid-19 vaccine improved severe disease protection in people aged 40 and older, in presentations made to U.S. scientists discussing a booster dose of Moderna\'s vaccine.\r\n<br><br>\r\nThe data was reported at a meeting of outside advisers to the U.S. Food and Drug Administration who are expected to vote later on Thursday on the need for a third dose of the Moderna vaccine at least six months after the initial two-shot inoculation. The FDA typically follows the advice of its experts but is not bound to do so.\r\n<br><br>\r\nModerna is seeking approval of a booster shot that includes 50 micrograms of vaccine, half of strength of its regular dose but still higher than the Pfizer-BioNTech shot, which contains 30 micrograms of vaccine.\r\n<br><br>\r\nDr. Ofer Levy, a panel member, said it is important to remember that the United States and Israel are different populations and that the vaccine Israel used is different, but he added that as both use similar mRNA technology the Israel findings are relevant.', 25, 0, 0, 1, '', '', '', 1, '2021-10-18'),
(8, '1634274231302_70_instagram_live_main-16342025003x2.jpg', 'Instagram Now Lets Users Schedule IG Live, How it Works', 'Tech', 'Instagram is now introducing a new tool to let users schedule IG Live up to 90 days in advance. For those unaware, Instagram Live lets users stream live videos to their followers through their Instagram Stories. It’s great for building engagement, connecting directly with your users, sharing news, and establishing your brand. Instagram says viewers will be able to “sign up\" for reminders to tune in. The Facebook-owned social media platform, in a post on Instagram, said it believes the feature would help with “discovery and distribution.\" Earlier in June, TikTok rolled out a set of creator tools that included the ability to schedule TikTok LIVE videos. The ByteDance-owned platform remains banned in India for security reasons.\r\n<br><br>\r\nTo schedule an Instagram Live, open the app and swipe left to right to open the camera. By default, Instagram sets the’ Story’ format, so swipe right and find Live. Then select ‘Schedule’> Set the name of the event > Set date and time. Users will then need to share it as a post with an image. Viewers will be able to see the post, description, and a prompt that contains the live link. The feature would help many creators as they can now promote their upcoming events. With scheduled Live events, creators can post countdown stories and much more.\r\n<br><br>\r\nMeanwhile, the platform has said it is testing a feature to notify users of outages or technical issues directly on the app, days after two outages disrupted Facebook and its services. The test will run in the United States and will go on for a few months, Instagram said in a blog post. On October 4, a six-hour-long outage prevented the company’s 3.5 billion users from accessing its social media and messaging services, including WhatsApp, Instagram, and Messenger.\r\n<br><br>\r\nInstagram has announced plans to integrate IGTV and feed videos into one format, namely Instagram Videos. It had also revealed plans to roll out a new Video tab on the profile, represented by a triangle. It will replace the classic IGTV box logo. The update will essentially be a big boost as to how users view videos on the platform.', 32, 0, 0, 2, '', '', '', 1, '2021-10-18'),
(9, '1634364780333_22_vaccine-india-3-16322342313x2.jpg', 'Digital Health Mission Launch: This is How Your Health ID Will Help Maintain Medical Records', 'Health', 'Prime Minister Narendra Modi on Monday announced the nationwide rollout of the National Digital Health Mission (NDHM), a scheme that will enable Indians to create and access digital health records.\r\n<br><br>\r\nThe mission, under which every Indian will get a unique 14-digit health identification (ID) number, has been renamed the Pradhan Mantri Digital Health Mission (PM-DHM).\r\n<br><br>\r\n“PM Narendra Modi ji to announce nationwide rollout of Pradhan Mantri Digital Health Mission on September 27. Under this, a unique digital health ID will be provided to the people, which will contain all the health records of the person,\" Union Health Minister Mansukh Mandaviya had tweeted on Thursday. \r\n<br><br>\r\nThe ID will be created using an Aadhar Card or the beneficiary’s mobile number, and will serve as an identifier to pull relevant health records.\r\n<br><br>\r\nA government official involved in the making of NDHM said the PM-DHM will act as a “one-stop solution” for all healthcare needs of the common man. It aims to develop the necessary backbone to support an integrated digital health infrastructure in the country.\r\n<br><br>\r\nThe mission will create electronic medical records (EMR) for each individual, according to the NDHM’s website, which will allow doctors to track data over time, easily identify which patients are due for preventive screenings or checkups, check how their patients are doing on certain parameters (such as blood pressure readings) and monitor and improve overall quality of care within the practice.\r\n<br><br>\r\nThe project was first launched in pilot phase in the Union Territories of Andaman and Nicobar Islands, Chandigarh, Dadra and Nagar Haveli, Daman and Diu, Ladakh, Lakshadweep, and Puducherry.\r\n<br><br>\r\n“This kind of digital communication will render cost effective services through access to large pool of clinicians and will help generate relevant data for health policy makers not only in modern medicine, preventive medicine, traditional system of medicines and Yoga for more inclusive healthcare system through interventions like artificial intelligence (AI) and machine learning (ML),” Dr. RS Sharma, CEO, National Health Authority, Union Ministry of Health and Family Welfare had said earlier.\r\n<br><br>\r\n<h4>How Will a Unique Health ID Work?</h4>\r\n<br>\r\nThe scheme consists of four essential blocks — unique digital health ID, healthcare professionals registry, health facility registry and electronic health records.\r\n<br><br>\r\nThe first objective of the scheme is to create a digital environment for healthcare via these four blocks. At a later stage, the government plans to integrate telemedicine and e-pharmacies.\r\n<br><br>\r\nA unique health ID, according to the government, is important to standardise the process of identification of an individual across healthcare providers. “The Health ID will be used for the purposes of uniquely identifying persons, authenticating them, and threading their health records (only with the informed consent of the patient) across multiple systems and stakeholders.”\r\n<br><br>\r\nTo generate ID, the system will collect certain basic details including demographic and location, family/relationship, and contact details.\r\n<br><br>\r\nApart from bringing doctors, the government will also create a comprehensive repository of all healthcare professionals working across both modern and traditional systems of medicine. It will also create a comprehensive repository of health facilities across India, including different systems of medicine.\r\n<br><br>\r\n“It includes both public and private health facilities including hospitals, clinics, diagnostic laboratories and imaging centers, pharmacies, etc.” \r\n<br><br>\r\n<h4>How Will Health Records be Created? </h4>\r\n<br>\r\nIn the first step, a health ID will be created after which health information from an individual will be taken. This information will then be linked to the health ID, after taking the consent from those individuals. The information termed as ‘Personal Health Record-System (PHR)’ will enable an individual to manage information about his or her healthcare, according to the NDHM’s website. This includes viewing of a longitudinal record, consisting of all health data, lab reports, treatment details, discharge summaries across one or multiple health facilities.\r\n<br><br>\r\nThe mission will create ‘Electronic medical record (EMR)’ which, as explained by the government, is a digital version of a patient’s chart. It contains the patient’s medical and treatment history. \r\n<br><br>\r\nAccording to Sharma, EMR can be accessed by various systems and enable domain specific registries through the unified health interface (UHI) very similar to the unified payment interface (UPI).\r\n<br><br>\r\n“UHI is poised to make the healthcare service delivery landscape more competitive, reliable and accessible. We have a ubiquitous network of 120 crore telephone connections, 70 crore internet connections and 60 crore mobile subscribers,” Sharma had said earlier while adding, “We have data prices which are the lowest in the world and the consumption pattern is also 12 GB per month per person which is very huge.”', 22, 0, 0, 2, '', '', '', 1, '2021-10-18'),
(10, '1634277105925_36_chennai-super-kings-ipl-2021-1-16342167663x2.jpg', 'IPL 2021 Final: KKR\'s Stunning Revival Pitted Against CSK\'s Supreme Legacy', 'Sports', 'Surprises and upset results are a staple of the Indian Premier League, but even allowing for such vicissitudes, this season has been extraordinary, best highlighted by the remarkable journey travelled by Kolkata Knight Riders who will play Chennai Super Kings in Friday’s final.\r\n<br><br>\r\nAll three matches in the play-offs before the final had last-over finishes, which shows the keen level of competition and how evenly distributed the talent was across the four sides. KKR, were involved in two of these three matches, and compelled to take the more tortuous route having finished fourth in the points table in the league stage. This only enhances their amazing story.\r\n<br><br>\r\nIn the first phase of the season played in India, KKR finished at 7th place, losing 5 out of seven matches. When the tournament resumed in the UAE, KKR were a team transformed, winning 5 out of seven matches much to everyone’s astonishment, and leapfrogged into the play-offs.\r\nTwo gripping contests, both providing edge of the seat excitement, saw KKR progress into the final. In the eliminator, they beat Royal Challengers Bangalore and in the second qualifier on Wednesday, Eoin Morgan’s team pulled off a sensational last-over win over Delhi Capitals.\r\n<br><br>\r\nThere are very few examples of any team tracing such an amazing trajectory in a season. KKR’s performances in the first and second phase as different as chalk and cheese, from utter mediocrity to excellence, raising queries as to how the same bunch of players could have played in such contrasting fashion within a few months.\r\n<br><br>\r\nClearly, the difference was not in the skills of the players, rather their mindset. In the first phase, KKR appeared listless, almost defeatist. Close matches were surrendered without a fight. It was almost as if the team accepted defeat as soon as it took the field. With low mental resolve, the body language of players too was negative, which in turn led to diminished trust in their own abilities, rise in mistakes and errors and consequently defeats.\r\n<br><br>\r\nBefore the second phase started, chief coach Brendon McCullum spoke that he and captain Morgan had spent time deliberating these aspects with the players, and the KKR team that would be seen in action in UAE would be a departure from the one in India. The target was to play with tempered aggression, a positive approach stemming from self-belief. This mantra worked brilliantly.\r\n<br><br>\r\nMind you KKR were not at full strength in this phase. Pace ace Pat Cummins had skipped the second half of the tournament, Andre Russell spent almost half the time in the dug out because of injury. These were two key overseas players, but their unavailability was hardly felt.\r\n<br><br>\r\nThere was also a question mark lingering over Sunil Narine, who has had to revise his action once again, and was also left out from the West Indies T20 World Cup squad. Narine had been integral to KKR’s prospects in previous seasons. Would he be able to cope technically and mentally this time too?\r\n<br><br>\r\nThen there was issue of the malfunctioning top order in the first phase. What could be done to improve this as there was very little back up strength available? Apart from Morgan, the important overseas recruits were all bowlers and allrounders: Narine, Russell, Shakib Al Hasan, Lockie Ferguson.\r\n<br><br>\r\nAnswers to these and other compunctions came in every match that KKR played in the second phase. There was both tenacity, flair and consistency in their performances. When matches got tight, the team regrouped swiftly, some player or the other putting his hand up to win the situation There were superb individual displays, like Narine in the eliminator against RCB where he picked up four priceless wickets and smashed 26 invaluable runs. Or a great show of nerves, like Rahul Tripathi hitting Ravichandran Ashwin for a six to seal a place in the final.\r\n<br><br>\r\nThe biggest decision taken by the team management, and which ended up paying the richest dividends, was pitching debutant Venkatesh Iyer as opener. A swashbuckling left-hander, Iyer was a revelation in the tournament, not too far behind KL Rahul and Ruturaj Gaikwad as opener. Iyer also showed bowling skills and his controlled medium-pace was of high value.\r\n<br><br>\r\nThe only failure was Morgan who is going through a dreadful lean trot, the sequence of scores reading like a telephone number. Suggestions that he should have dropped himself in the play-offs were laughable. As captain, Morgan was astute, demanding, understanding, inspiring, and got the best out of his players, which made him invaluable.\r\n<br><br>\r\nI have dealt with at length about KKR because their campaign in this tournament was so extraordinary. They are on the cusp of a memorable win, but that won’t come on a platter because CSK, barring a minor slump towards the end of the league phase, have been playing terrific cricket too, finding ways and means to win through crises, batsmen or bowlers rising to the occasion with special performances.\r\n<br><br>\r\nCSK’s legacy in the IPL is magnificent, which adds to the pressure on players, many of whom are on the wrong side of 30. Led by the iconic MS Dhoni, these players have sustained form, fitness and focus for a protracted period of time, which is not just admirable, but also the biggest threat for KKR in the final; though on lead in form, the Kolkata side looks more rounded.\r\n<br><br>\r\nIn batting, CSK’s top order has been wobbly, apart from openers Gaikwad and Faf du Plessis, who’ve been outstanding. Uthappa played a sparkling knock in the qualifier, but runs have been hard to come by for others in the middle order, Moeen Ali, Suresh Raina and even Dhoni till his spectacular late assault against DC which saw CSK through.\r\n<br><br>\r\nKKR bowlers, especially Shakib, Narine and Varun Chakravarthy pose a serious threat to the CSK batting. In two previous matches, this troika of spinners has conceded just 65 and 80 runs collectively in 12 overs each game, and also picked up a bagful of wickets, strangling opponents at the start, in the middle and in the death overs. Ferguson and Shivam Mavi have been accurate and incisive too, though the spotlight on them hasn’t been much.\r\n<br><br>\r\nDespite the iffy form in batting and bowling, the fact that CSK are in the final shows ambition, mental toughness and ability to withstand pressure. To sustain form, fitness and motivation for a protracted period of time demands stringent physical and mental conditioning. For sheer self-belief, there is perhaps no better side than CSK, who have been champions thrice and in an IPL final for the 9th time, a simple stat that speaks volumes.\r\n<br><br>\r\nKKR have been twice winners of the title, the last time way back in 2014. They’ve come back from the brink this season and are one step away from charting the finest turnaround story in the IPL.\r\n<br><br>\r\nIt promises to be a heck of a match!', 145, 0, 0, 2, '', '', '', 1, '2021-10-18'),
(17, '1634570642059_82_stanikzai.jpeg-16302910513x2.jpg', 'EXCLUSIVE | More Cracks in Taliban as Int\'l Face Stanikzai Upset with Afghan Regime, Pak Meddling', 'World', 'It’s no secret that Afghanistan‘s Taliban regime is under considerable international pressure to adopt a moderate avatar and introduce more compassion and modernity into its governance style. The Islamist group has frequently made the right noises — promising to respect women’s rights, forgive those who fought against it, and prevent Afghanistan from being used as a base for terror attacks. But the world is keeping an eye on its actions, and they have been less-than-satisfactory so far. And it seems the strain is proving too much. Sources have told CNN-News18 that Sher Mohammad Abbas Stanikzai, the internationally recognised face of the Taliban, has told the regime in clear terms that managing the global diplomatic expectations is becoming demanding.<br>Afghanistan’s deputy minister of foreign affairs, who is yet to join office, is one of the key leaders controlling the Taliban’s international narrative and took the lead in negotiating a peace pact in Doha with the United States.<br>ALSO READ | PM Modi, Johnson Talk About Dealing With Taliban. Here’s the PM’s Stand on Afghanistan in the Past Month<br>Sources said Stanikazai is upset with the present face of the Afghan administration and with the interference of Pakistan’s Inter-Services Intelligence (ISI) in the government formation process.<br>​The Taliban’s Doha team has been absolutely marginalised within the Afghan government because of Pakistan, sources say. That’s because members of the notorious Haqqani network managed by the ISI have grabbed key posts in the Afghan administration and they do not want an inclusive government.<br>Sources say Stanikzai left Doha on Sunday and has reached Dubai following recent talks with the United States in the Qatari capital—the first since the Taliban seized power in August even as a two-decade-long US engagement in Afghanistan was ending. The Taliban are seeking international recognition, as well as assistance to avoid a humanitarian disaster and ease Afghanistan’s spiralling economic crisis with its funds frozen by America and other nations.<br>The regime’s efforts to consolidate power have also been dented by a series of deadly attacks in the country by the Islamic State Khorasan (ISIS-K) group.<br>Sources also told CNN-News18 on Sunday that the Taliban have confirmed the death of their elusive chief Hibatullah Akhundzada in a suicide attack orchestrated by Pakistani forces last year. Akhundzada had the final say in the Taliban on all matters political, military and religious.<br>ALSO READ | EXCLUSIVE | Taliban Confirm Chief Hibatullah Akhundzada Died in Suicide Attack by Pak Forces Last Year<br>CNN-News18 tried to contact Stanikzai and a Taliban spokesperson but received no response.<br><a href=\'https://www.news18.com/news/world/exclusive-more-cracks-in-taliban-as-international-face-stanikzai-upset-with-afghan-regime-pak-meddling-4336580.html\'>Read More</a>', 2, 0, 0, 2, '', '', '', 1, '2021-10-18');

-- --------------------------------------------------------

--
-- Table structure for table `comment`
--

CREATE TABLE `comment` (
  `comment_id` int(11) NOT NULL,
  `comment_auther` varchar(40) NOT NULL,
  `comment_desc` text NOT NULL,
  `article_id` int(11) NOT NULL,
  `comment_status` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `comment`
--

INSERT INTO `comment` (`comment_id`, `comment_auther`, `comment_desc`, `article_id`, `comment_status`) VALUES
(1, 'Kamal', 'This is great news, CSK is going to win.', 10, 1),
(3, 'Animesh', 'I think KKR is strong contender for the match. Surely the match will be interesting.', 10, 1),
(5, 'animesh', 'Instagram is a great new way for income to youth of India.', 8, 1),
(6, 'Rohit', 'Instagram is pathetic.', 8, 1),
(7, 'Animesh', 'Once again Dhoni\'s experience came on top. KKR was thrashed on final. CSK won IPL for fourth time. Now it is just one trophy behind Mumbai Indians.', 10, 1),
(8, 'Raman', 'Moderna is not that effective as pfizer.', 7, 1),
(9, 'Animesh', 'Apple products are good', 3, 1);

-- --------------------------------------------------------

--
-- Table structure for table `emails`
--

CREATE TABLE `emails` (
  `id` int(11) NOT NULL,
  `email` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `emails`
--

INSERT INTO `emails` (`id`, `email`) VALUES
(4, 'animesh09021998@gmail.com'),
(30, 'animesh98.sinha@gmail.com');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`admin_id`);

--
-- Indexes for table `article`
--
ALTER TABLE `article`
  ADD PRIMARY KEY (`article_id`);

--
-- Indexes for table `comment`
--
ALTER TABLE `comment`
  ADD PRIMARY KEY (`comment_id`);

--
-- Indexes for table `emails`
--
ALTER TABLE `emails`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `admin_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `article`
--
ALTER TABLE `article`
  MODIFY `article_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `comment`
--
ALTER TABLE `comment`
  MODIFY `comment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `emails`
--
ALTER TABLE `emails`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
