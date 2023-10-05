USE filmsDB

--INSERT FILMS

INSERT INTO Film (title, duration, coutry_of_production,year_of_production,category)
VALUES 
('Intouchables', 112,'France',2011,'Comedy'),
('The Green Mile', 180,'USA',1999,'Drama'),
('The Shawshank Redemption', 142,'France',1994,'Drama'),
('The Godfather', 180,'USA',1972,'Drama'),
('The Dark Knight', 152,'USA',2008,'Action'),
('Schilder''s List', 190,'USA',1993,'Drama'),
('Inception', 150,'USA',2010,'Action'),
('Fight Club', 122,'USA',1999,'Drama'),
('The Matrix', 162,'USA',1999,'Action'),
('Goodfellas', 150,'USA',1990,'Crime'),
('Seven Samurai', 160,'France',2008,'Action'),
('Interstellar', 153,'Germany',2014,'Action'),
('Hara-Kiri', 172,'Japan',1962,'Drama'),
('Life is Beautiful', 121,'France',2003,'Romance'),
('The best of youth', 366,'Belgium',2003,'Drama'),
('Leviathan', 126,'France',2014,'Crime'),
('Amour', 146,'France',1997,'Drama'),
('Amelie', 100,'Poland',1991,'Romance'),
('Memento', 110,'Turkey',1980,'Drama'),
('Witness for the Prosecution',120,'USA',1954,'Mystery');


--INSERT PEOPLE

INSERT INTO Person(name,surname)
VALUES 
('Goerge','Lucas'),
('Seth','Herring'),
('Rene ','Douglas'),
('Axel',' Davies'),
('Olivia','Snow'),
('Calvin','Meyers'),
('Raul','Harmon'),
('Elvis','Hughes'),
('Barbara','Downs'),
('Jacey ','Henderson'),
('Ana','Barro'),
('Reese','Hodges'),
('Hannah','Barrera'),
('Annika ','Herring'),
('Reese',' Dixon'),
('Sergio ','Fitzgerald'),
('Alivia',' Medina'),
('Jeffrey ','Diaz'),
('Zion','Bentley'),
('Harrison ','Bush'),
('Jared', 'Krause'),
('Maxwell' ,'Barlow'),
('Lily-Mae' ,'Knowles'),
('Roberto' ,'Harvey'),
('Alaina', 'Hahn'),
('Stella' ,'Felix'),
('Macauley', 'Hunter'),
('Cain' ,'Whyte'),
('Aamna' ,'Mcghee'),
('Angelica' ,'Snider'),
('Hari' ,'Rice'),
('Cassius' ,'Plummer'),
('Arran' ,'Bassett'),
('Kaylem' ,'Sandoval'),
('Jolie', 'Conner'),
('Aniqa' ,'Mccarthy'),
('Franklyn', 'Cervantes'),
('Umaima' ,'Pemberton'),
('Gregor' ,'Contreras'),
('Daanyaal', 'Hawes'),
('Darryl', 'Monroe'),
('Elicia', 'Whitehouse'),
('Tarik' ,'Howell'),
('Lexi' ,'Ball'),
('Leo' ,'Major'),
('Sam' ,'Stone'),
('Zuzanna' ,'Fischer'),
('Patrik' ,'Winters'),
('Bree' ,'Harwood'),
('Javier', 'Randall');


--INSERT REWARDS

INSERT INTO Reward(reward_name,organisation)
VALUES 
('AFA', 'Asianet Film Awards'),
('AVF', 'Aval Viridugal Function'),
('CMA', 'CineMAA Awards'),
('ETA', 'Edison Tamil Awards'),
('DPA', 'Dadasaheb Phalke Award'),
('FA', 'Filmfare Awards'),
('FAE', 'Filmfare Awards East'),
('FAS', 'Filmfare Awards South'),
('FSFA', 'Filmfare Short Film Awards'),
('IIFA', 'IIFA Utsavam'),
('KSFA', 'Karnataka State Film Award'),
('KSFA', 'Kerala State Film Awards'),
('OSFA', 'Odisha State Film Awards'),
('PCA', 'Prag Cine Awards'),
('RFF', 'Rajasthan Film Festival'),
('RFTF', 'RED FM Tulu Film Awards'),
('SFA', 'Santosham Film Awards'),
('SSFA', 'SIIMA Short Film Awards'),
('SA', 'Screen Awards'),
('STA', 'Stardust Awards'),
('TNS', 'Tamil Nadu State Film Awards'),
('TSR', 'TSR - TV9 National Awards'),
('VFA', 'Vanitha Film Awards'),
('VA', 'Vijay Awards'),
('ZCA', 'Zee Cine Awards'),
('ZCAT', 'Zee Cine Awards Telug');

--INSERT REVIEWERS

INSERT INTO Reviewer(email,nickname,pass_hash,reviews_num)
VALUES 
('dorothy.keeling@wintheiser.org', 'Snoopy', 'dcc677a9955530341f737fd8de8fe1f9', '14'),
('curt52@bernier.com', 'Braveheart', 'ba248c985ace94863880921d8900c53f', '22'),
('neil.thiel@hotmail.com', 'Pinata', '9f6e6800cfae7749eb6c486619254b9c', '354'),
('bill33@dickinson.com', 'Loser', '00f263c4a3bb500abb7462b7b982a29a', '412'),
('blick.nickolas@gmail.com', 'Red', '95a838fd81d8dccb2140ab4a2ad7eb57', '59'),
('tiara41@gmail.com', 'Big Guy', 'b43d6a550dae760d099f2931ed53b216', '26'),
('nyasia.wolf@conn.com', 'Crumbles', 'cc5b206490862c146bd84938d10829ea', '447'),
('nellie.anderson@howe.org', 'Autumn', '70a9a5b952d6b7e25ce23ca0cdf4ec92', '38'),
('bweimann@kunze.biz', 'Amour', 'a51c008b213c7a0462e49895df164b50', '19'),
('mccullough.emanuel@collins.com', 'Boo Boo', 'e61e7de603852182385da5e907b4b232', '210'),
('jbeatty@casper.com', 'Amorcita', 'c99f825e651a6bfaf6745c4ca28a41f8', '121'),
('flueilwitz@emard.com', 'Frau Frau', '01455310692b5c069c39ba9964c6e6ea', '142'),
('iledner@collins.com', 'Buffalo', 'd03994ce794a6a98c9f768a926a67b3a', '123'),
('ebony.flatley@reichert.com', 'Anvi', '95ebc3c7b3b9f1d2c40fec14415d3cb8', '141'),
('cstroman@yahoo.com', 'Pretty Lady', '252490767cc8dc72aca6ef466c63243f', '150'),
('bonnie.goldner@pfannerstill.net', 'Hulk', 'ee9c69e15761785533b4418806160247', '162'),
('smitham.river@gmail.com', 'Sourdough', 'db91578a7b80907e6d18a23dbb83b26f', '173'),
('griffin.marvin@gmail.com', 'MomBod', '71a3cb155f8dc89bf3d0365288219936', '184'),
('treutel.susan@gmail.com', 'Piggy', '7b8b965ad4bca0e41ab51de7b31363a1', '195'),
('narmstrong@hotmail.com', 'Rubber', '2029a209ccfd1186141fce6d6c8cc1ee', '202');


--INSERT REVIEWS

INSERT INTO Review(id_reviewer,id_film,stars_num,rev_contents,rev_date)
VALUES 
(
		(SELECT id_reviewer FROM Reviewer WHERE Reviewer.email='iledner@collins.com'),
		(SELECT id_film FROM Film WHERE Film.title='Inception' AND Film.year_of_production='2010'),
		'5',
		'This is what ruined it for me. It reminded me of the last 
		Resident Evil movie with how many cuts there were in the action scenes,
		which Mila Jovovich also starred in. I don''t see how they didn''t learn their
		lesson from that. Within a 10 second period there are 8 to 10 cuts which make the action scenes 
		hard to watch, and most importantly enjoy. With this being an action film I can''t recommend spending
		money to watch since the action scenes are ruined by the amount of mind numbing cuts in them.',
		'2019-11-20'
),
(
		(SELECT id_reviewer FROM Reviewer WHERE Reviewer.email='narmstrong@hotmail.com'),
		(SELECT id_film FROM Film WHERE Film.title='Inception' AND Film.year_of_production='2010'),
		'4',
		'After being locked up since March and waiting for this movie I was expecting an adventure. 
		Something epic and fun. All we got was a badly made stretched out episode of a tv show. This 
		film would have been an incredible tv show as a format. The film ends at a big cliffhanger and it 
		doesnt even resolve the plot to begin with. The acting was horrendous, the pacing too. The first half
		of the movie could have ended in about 20 minutes instead it stretches for about an hour and 10 minutes. 
		Such a shame. I say kill the sequel and turn it into a tv show. Honestly would be a much better fit.’ ',
		'2020-10-22'
),
(
		(SELECT id_reviewer FROM Reviewer WHERE Reviewer.email='treutel.susan@gmail.com'),
		(SELECT id_film FROM Film WHERE Film.title='Hara-Kiri' AND Film.year_of_production='1962'),
		'3',
		'Honestly, I was really excited for this movie, but how bad it was..
		The acting was bad, the plot was bad (didnt make ANY sense at all), the 
		CGI was normal to okay and the editing???? No idea what happened there.
		Trust me, save your money and see something else.’ ',
		'2020-12-31'
),

(
		(SELECT id_reviewer FROM Reviewer WHERE Reviewer.email='tiara41@gmail.com'),
		(SELECT id_film FROM Film WHERE Film.title='Hara-Kiri' AND Film.year_of_production='1962'),
		'2',
		'Not worth your time! 35 min in to the movie I was asking myself "why am I watching this sh** Better install the game, 
		play for an hour and uninstall it, than watching this.
		The producers and writers of this movie must of been drunk or something during the entire movie creation process.’ ',
		'2020-01-22'
),
(
		(SELECT id_reviewer FROM Reviewer WHERE Reviewer.email='cstroman@yahoo.com'),
		(SELECT id_film FROM Film WHERE Film.title='Amelie' AND Film.year_of_production='1991'),
		'1',
		'How this garbage came to be is beyond me. They spend the
		entire budget on the monsters it seems and none on the surroundings and actors.
		Choise of actors and the acting itself was way sub par. Don''t bother paying for it. ',
		'2012-02-11'			   

),

(
		(SELECT id_reviewer FROM Reviewer WHERE Reviewer.email='cstroman@yahoo.com'),
		(SELECT id_film FROM Film WHERE Film.title='Amelie' AND Film.year_of_production='1991'),
		'2',
		'So, it''s about this really stupid grown-up and there''s blood and stuff and it''
		s not appropriate for anyone else in my class, probably, but, you know, you guys let me watch stuff like this. What is up with that? And there''s 
		this really bad girl named Jenny, and I hated her clothes. But once she cuts her hair she turns good again. And a guy with no legs, who was weird. 
		He made shrimp, which is gross, except for the popcorn kind. 
		He got a lot better when he cut his hair, too. I liked it. It was funny. Can I watch it again tonight? ',
		'2018-07-25'			   

),

(
		(SELECT id_reviewer FROM Reviewer WHERE Reviewer.email='smitham.river@gmail.com'),
		(SELECT id_film FROM Film WHERE Film.title='Life is Beautiful' AND Film.year_of_production='2003'),
		'4',
		'I think that the best movies are those that you ''appreciate'' or 
		understand after seeing it more than once. However, with ''forrest gump''
		, i fell in love with it after the first 15 minutes and knew it would be in my top 10 straight away. ',
		'2017-10-06'			   

),

(
		(SELECT id_reviewer FROM Reviewer WHERE Reviewer.email='iledner@collins.com'),
		(SELECT id_film FROM Film WHERE Film.title='Leviathan' AND Film.year_of_production='2014'),
		'3',
		'How this garbage came to be is beyond me. They spend the
		entire budget on the monsters it seems and none on the surroundings and actors.
		Choise of actors and the acting itself was way sub par. Don''t bother paying for it. ',
		'2017-11-05'			   

),

(
		(SELECT id_reviewer FROM Reviewer WHERE Reviewer.email='bweimann@kunze.biz'),
		(SELECT id_film FROM Film WHERE Film.title='The Shawshank Redemption' AND Film.year_of_production='1994'),
		'3',
		'Wow. An incredible film. I watched many other movies of Tom Hanks, Now i understand that 
		i made a great mistake by not watching this movie this long. This is such an epic. 
		Terrific acting by Tom Hanks, dint knew that he was this versatile. ',
		'2015-06-06'			   

),
(
		(SELECT id_reviewer FROM Reviewer WHERE Reviewer.email='iledner@collins.com'),
		(SELECT id_film FROM Film WHERE Film.title='Amelie' AND Film.year_of_production='1991'),
		'2',
		'How this garbage came to be is beyond me. They spend the
		entire budget on the monsters it seems and none on the surroundings and actors.
		Choise of actors and the acting itself was way sub par. Don''t bother paying for it. ',
		'2016-07-13'			   

),
(
		(SELECT id_reviewer FROM Reviewer WHERE Reviewer.email='bweimann@kunze.biz'),
		(SELECT id_film FROM Film WHERE Film.title='Witness for the Prosecution' AND Film.year_of_production='1954'),
		'1',
		'This movie was amazing. It reminds me of my rises and falls in my life and just seeing how resilient 
		Forrest Gump became was really inspiring. He had so much to offer the world, even when no one saw his ability
		to contribute to society. He did everything from leading a football team to a championship, to being a war hero. 
		Even through the tough times in high school to the frantic relationship with Jenny,
		Forrest still remained humble and resilient. Any anti-bullying campaign, in my opinion, should use Forrest Gump as a prime example. ',
		'2020-08-15'			   

),
(
		(SELECT id_reviewer FROM Reviewer WHERE Reviewer.email='bill33@dickinson.com'),
		(SELECT id_film FROM Film WHERE Film.title='Memento' AND Film.year_of_production='1980'),
		'5',
		'Of course I heard about this famous ''Run, Forrest, run!'', and how Forrest Gump is the best of Hanks'' 
		acting career. However, I could tell this was not my kind of movie according to basic information provided. 
		It has one narrative which happens to be biographical. ',
		'2017-11-13'			   

),
(
		(SELECT id_reviewer FROM Reviewer WHERE Reviewer.email='smitham.river@gmail.com'),
		(SELECT id_film FROM Film WHERE Film.title='The Godfather' AND Film.year_of_production='1972'),
		'5',
		'How this garbage came to be is beyond me. They spend the
		entire budget on the monsters it seems and none on the surroundings and actors.
		Choise of actors and the acting itself was way sub par. Don''t bother paying for it. ',
		'2018-12-14'			   

),
(
		(SELECT id_reviewer FROM Reviewer WHERE Reviewer.email='griffin.marvin@gmail.com'),
		(SELECT id_film FROM Film WHERE Film.title='Fight Club' AND Film.year_of_production='1999'),
		'2',
		'actually this movie is one of my favorite movies. the story is amazing, breathtaking. and tom hanks is rocking it! every human on earth should watch this movie! the story shows 
		us that no matter what we can still do big things as long as we believe. Forrest is an inspiration for so many. if you haven''t seen this movie yet, let g ',
		'2020-04-02'			   

),
(
		(SELECT id_reviewer FROM Reviewer WHERE Reviewer.email='cstroman@yahoo.com'),
		(SELECT id_film FROM Film WHERE Film.title='Goodfellas' AND Film.year_of_production='1990'),
		'3',
		'The best film I have ever seen. If you are looking for something meaningful here''s the stuff!!!
		Cinema is all about how it makes you feel. I think I felt in every possible way during this film at the right guantities the perfect moment.
		After this unsurpassed experience I became a better person or more specifically I knew how I wanted to be as a person.',
		'2019-08-09'			   

),
(
		(SELECT id_reviewer FROM Reviewer WHERE Reviewer.email='nellie.anderson@howe.org'),
		(SELECT id_film FROM Film WHERE Film.title='The Godfather' AND Film.year_of_production='1972'),
		'4',
		'There is an unfortunate time when you watch this film, its not the film thats the problem 
		its my highly evident fear of the next few films I watch just seeming so bad. For simply not being this. 
		Its everything. Its a romantic-comedy-tragedy-life-story-historical-personal- uplifting-war story. ',
		'2015-12-13'			   

),
(
		(SELECT id_reviewer FROM Reviewer WHERE Reviewer.email='nellie.anderson@howe.org'),
		(SELECT id_film FROM Film WHERE Film.title='The Godfather' AND Film.year_of_production='1972'),
		'4',
		'A great movie, its great story and the story of Lieutenant Dan was sad, but I think 
		it does not deserve the Academy Award for Best Film. I really enjoyed watching the movie and hated the character of Jenny. ',
		'2016-01-02'			   

),
(
		(SELECT id_reviewer FROM Reviewer WHERE Reviewer.email='nellie.anderson@howe.org'),
		(SELECT id_film FROM Film WHERE Film.title='The Godfather' AND Film.year_of_production='1972'),
		'5',
		'My friend suggested me to watch this movie. I didn''t expect anything out of it, just wanted to pass some time. 
		After the movie ended, I felt like I had never seen anything like this before.. It even made me write a review. ',
		'2018-09-20'			   

),
(
		(SELECT id_reviewer FROM Reviewer WHERE Reviewer.email='nellie.anderson@howe.org'),
		(SELECT id_film FROM Film WHERE Film.title='The Godfather' AND Film.year_of_production='1972'),
		'2',
		'How this garbage came to be is beyond me. They spend the
		entire budget on the monsters it seems and none on the surroundings and actors.
		Choise of actors and the acting itself was way sub par. Don''t bother paying for it. ',
		'2020-12-25'			   

),
(
		(SELECT id_reviewer FROM Reviewer WHERE Reviewer.email='mccullough.emanuel@collins.com'),
		(SELECT id_film FROM Film WHERE Film.title='Seven Samurai' AND Film.year_of_production='2008'),
		'4',
		'How this garbage came to be is beyond me. They spend the
		entire budget on the monsters it seems and none on the surroundings and actors.
		Choise of actors and the acting itself was way sub par. Don''t bother paying for it. ',
		'2020-11-26'			   

),
(
		(SELECT id_reviewer FROM Reviewer WHERE Reviewer.email='bweimann@kunze.biz'),
		(SELECT id_film FROM Film WHERE Film.title='Seven Samurai' AND Film.year_of_production='2008'),
		'3',
		'An absolutely remarkable film about a decent, humble man who throughout his 
		life met a few presidents, fought in Vietnam, was a professional Ping Pong player
		and ran around the whole country of America while also meeting celebrities like John Lennon and Elvis Presley. 
		A truly heart changing film that will change your life forever. After all this Forrest had an I.Q of 75 but that didn''t stop him. ',
		'2012-10-14'			   

),
(
		(SELECT id_reviewer FROM Reviewer WHERE Reviewer.email='bweimann@kunze.biz'),
		(SELECT id_film FROM Film WHERE Film.title='Life is Beautiful' AND Film.year_of_production='2003'),
		'5',
		'This awesome movie is about an innocent man who represents how the world should be: he''s 
		loyal, humble, honest, he would never cheat or lie. He does everything with good heart and reaches success at the most important tasks of life. ',
		'2017-05-08'			   

),

(
		(SELECT id_reviewer FROM Reviewer WHERE Reviewer.email='jbeatty@casper.com'),
		(SELECT id_film FROM Film WHERE Film.title='Interstellar' AND Film.year_of_production='2014'),
		'4',
		'And leading the film in this odyssey of American life is Tom Hanks playing Gump
		(he won his second Oscar for his portrayal) in a film that shows one man who goes through many events 
		in history to find the one he loves. Well done, well acted, and well directed to pythagorean procision. A++. ',
		'2020-10-11'			   

);

--INSERT FUNCTION PROFESSION

INSERT INTO FunctionProfession (profession)
VALUES 

	('Actor'),
    ('Director'),
    ('Producer'),
    ('Designer'),
    ('Director of Photography'),
    ('Costume Designer'),		
    ('Makeup Artist'),		
    ('Movie Editor'),		
	('Advertiser'),
	('Hair Stylist'),
	('Camera Operator'),
	('Production Assistant'),
	('Sound Engineer'),
	('Location Manager');

--INSERT PERSON_FUNC_PER_FILM

INSERT INTO Person_func_per_film(id_person,id_film,id_function)
VALUES 
--Inception
(
		('1'),
		(SELECT id_film FROM Film WHERE Film.title='Inception' AND Film.year_of_production='2010'),
		(SELECT id_function FROM FunctionProfession WHERE FunctionProfession.profession='Actor')
		
),
(
		('2'),
		(SELECT id_film FROM Film WHERE Film.title='Inception' AND Film.year_of_production='2010'),
		(SELECT id_function FROM FunctionProfession WHERE FunctionProfession.profession='Actor')
		
),
(
		('3'),
		(SELECT id_film FROM Film WHERE Film.title='Inception' AND Film.year_of_production='2010'),
		(SELECT id_function FROM FunctionProfession WHERE FunctionProfession.profession='Actor')
		
),
(
		('4'),
		(SELECT id_film FROM Film WHERE Film.title='Inception' AND Film.year_of_production='2010'),
		(SELECT id_function FROM FunctionProfession WHERE FunctionProfession.profession='Actor')
		
),
(
		('5'),
		(SELECT id_film FROM Film WHERE Film.title='Inception' AND Film.year_of_production='2010'),
		(SELECT id_function FROM FunctionProfession WHERE FunctionProfession.profession='Actor')


		
),
(
		('3'),
		(SELECT id_film FROM Film WHERE Film.title='Inception' AND Film.year_of_production='2010'),
		(SELECT id_function FROM FunctionProfession WHERE FunctionProfession.profession='Director')


		
),
(
		('2'),
		(SELECT id_film FROM Film WHERE Film.title='Inception' AND Film.year_of_production='2010'),
		(SELECT id_function FROM FunctionProfession WHERE FunctionProfession.profession='Producer')

				
),
--Hara-kiri
(
		('10'),
		(SELECT id_film FROM Film WHERE Film.title='Hara-Kiri' AND Film.year_of_production='1962'),
		(SELECT id_function FROM FunctionProfession WHERE FunctionProfession.profession='Actor')
		
),
(
		('2'),
		(SELECT id_film FROM Film WHERE Film.title='Hara-Kiri' AND Film.year_of_production='1962'),
		(SELECT id_function FROM FunctionProfession WHERE FunctionProfession.profession='Actor')
		
),
(
		('12'),
		(SELECT id_film FROM Film WHERE Film.title='Hara-Kiri' AND Film.year_of_production='1962'),
		(SELECT id_function FROM FunctionProfession WHERE FunctionProfession.profession='Actor')
		
),
(
		('11'),
		(SELECT id_film FROM Film WHERE Film.title='Hara-Kiri' AND Film.year_of_production='1962'),
		(SELECT id_function FROM FunctionProfession WHERE FunctionProfession.profession='Actor')
		
),
(
		('8'),
		(SELECT id_film FROM Film WHERE Film.title='Hara-Kiri' AND Film.year_of_production='1962'),
		(SELECT id_function FROM FunctionProfession WHERE FunctionProfession.profession='Actor')
			   		
),
(
		('9'),
		(SELECT id_film FROM Film WHERE Film.title='Hara-Kiri' AND Film.year_of_production='1962'),
		(SELECT id_function FROM FunctionProfession WHERE FunctionProfession.profession='Director')
		
),
(
		('15'),
		(SELECT id_film FROM Film WHERE Film.title='Hara-Kiri' AND Film.year_of_production='1962'),
		(SELECT id_function FROM FunctionProfession WHERE FunctionProfession.profession='Producer')
			   		
),
(
		('17'),
		(SELECT id_film FROM Film WHERE Film.title='Hara-Kiri' AND Film.year_of_production='1962'),
		(SELECT id_function FROM FunctionProfession WHERE FunctionProfession.profession='Movie Editor')
		
),
--SEVEN samurai
(
		('10'),
		(SELECT id_film FROM Film WHERE Film.title='Seven Samurai' AND Film.year_of_production='2008'),
		(SELECT id_function FROM FunctionProfession WHERE FunctionProfession.profession='Actor')
		
),
(
		('23'),
		(SELECT id_film FROM Film WHERE Film.title='Seven Samurai' AND Film.year_of_production='2008'),
		(SELECT id_function FROM FunctionProfession WHERE FunctionProfession.profession='Actor')
		
),
(
		('32'),
		(SELECT id_film FROM Film WHERE Film.title='Seven Samurai' AND Film.year_of_production='2008'),
		(SELECT id_function FROM FunctionProfession WHERE FunctionProfession.profession='Actor')
		
),
(
		('24'),
		(SELECT id_film FROM Film WHERE Film.title='Seven Samurai' AND Film.year_of_production='2008'),
		(SELECT id_function FROM FunctionProfession WHERE FunctionProfession.profession='Actor')
		
),
(
		('25'),
		(SELECT id_film FROM Film WHERE Film.title='Seven Samurai' AND Film.year_of_production='2008'),
		(SELECT id_function FROM FunctionProfession WHERE FunctionProfession.profession='Actor')
			   	
),
(
		('21'),
		(SELECT id_film FROM Film WHERE Film.title='Seven Samurai' AND Film.year_of_production='2008'),
		(SELECT id_function FROM FunctionProfession WHERE FunctionProfession.profession='Director')


		
),
(
		('32'),
		(SELECT id_film FROM Film WHERE Film.title='Seven Samurai' AND Film.year_of_production='2008'),
		(SELECT id_function FROM FunctionProfession WHERE FunctionProfession.profession='Producer')

				
),

(
		('32'),
		(SELECT id_film FROM Film WHERE Film.title='Seven Samurai' AND Film.year_of_production='2008'),
		(SELECT id_function FROM FunctionProfession WHERE FunctionProfession.profession='Advertiser')

				
),
(
		('32'),
		(SELECT id_film FROM Film WHERE Film.title='Seven Samurai' AND Film.year_of_production='2008'),
		(SELECT id_function FROM FunctionProfession WHERE FunctionProfession.profession='Designer')

				
),
--GODFATHER
(
		('11'),
		(SELECT id_film FROM Film WHERE Film.title='The Godfather' AND Film.year_of_production='1972'),
		(SELECT id_function FROM FunctionProfession WHERE FunctionProfession.profession='Actor')
		
),
(
		('27'),
		(SELECT id_film FROM Film WHERE Film.title='The Godfather' AND Film.year_of_production='1972'),
		(SELECT id_function FROM FunctionProfession WHERE FunctionProfession.profession='Actor')
		
),
(
		('50'),
		(SELECT id_film FROM Film WHERE Film.title='The Godfather' AND Film.year_of_production='1972'),
		(SELECT id_function FROM FunctionProfession WHERE FunctionProfession.profession='Actor')
		
),
(
		('29'),
		(SELECT id_film FROM Film WHERE Film.title='The Godfather' AND Film.year_of_production='1972'),
		(SELECT id_function FROM FunctionProfession WHERE FunctionProfession.profession='Actor')
		
),
(
		('42'),
		(SELECT id_film FROM Film WHERE Film.title='The Godfather' AND Film.year_of_production='1972'),
		(SELECT id_function FROM FunctionProfession WHERE FunctionProfession.profession='Actor')
			   	
),
(
		('41'),
		(SELECT id_film FROM Film WHERE Film.title='The Godfather' AND Film.year_of_production='1972'),
		(SELECT id_function FROM FunctionProfession WHERE FunctionProfession.profession='Director')


		
),
(
		('10'),
		(SELECT id_film FROM Film WHERE Film.title='The Godfather' AND Film.year_of_production='1972'),
		(SELECT id_function FROM FunctionProfession WHERE FunctionProfession.profession='Producer')

				
),

(
		('3'),
		(SELECT id_film FROM Film WHERE Film.title='The Godfather' AND Film.year_of_production='1972'),
		(SELECT id_function FROM FunctionProfession WHERE FunctionProfession.profession='Advertiser')

				
),
(
		('4'),
		(SELECT id_film FROM Film WHERE Film.title='The Godfather' AND Film.year_of_production='1972'),
		(SELECT id_function FROM FunctionProfession WHERE FunctionProfession.profession='Designer')

				
),
--INTERSTERLLAR
(
		('13'),
		(SELECT id_film FROM Film WHERE Film.title='Interstellar' AND Film.year_of_production='2014'),
		(SELECT id_function FROM FunctionProfession WHERE FunctionProfession.profession='Actor')
		
),
(
		('29'),
		(SELECT id_film FROM Film WHERE Film.title='Interstellar' AND Film.year_of_production='2014'),
		(SELECT id_function FROM FunctionProfession WHERE FunctionProfession.profession='Actor')
		
),
(
		('32'),
		(SELECT id_film FROM Film WHERE Film.title='Interstellar' AND Film.year_of_production='2014'),
		(SELECT id_function FROM FunctionProfession WHERE FunctionProfession.profession='Actor')
		
),
(
		('34'),
		(SELECT id_film FROM Film WHERE Film.title='Interstellar' AND Film.year_of_production='2014'),
		(SELECT id_function FROM FunctionProfession WHERE FunctionProfession.profession='Actor')
		
),
(
		('33'),
		(SELECT id_film FROM Film WHERE Film.title='Interstellar' AND Film.year_of_production='2014'),
		(SELECT id_function FROM FunctionProfession WHERE FunctionProfession.profession='Actor')
			   	
),
(
		('21'),
		(SELECT id_film FROM Film WHERE Film.title='Interstellar' AND Film.year_of_production='2014'),
		(SELECT id_function FROM FunctionProfession WHERE FunctionProfession.profession='Director')


		
),
(
		('49'),
		(SELECT id_film FROM Film WHERE Film.title='Interstellar' AND Film.year_of_production='2014'),
		(SELECT id_function FROM FunctionProfession WHERE FunctionProfession.profession='Hair Stylist')
						
),

(
		('31'),
		(SELECT id_film FROM Film WHERE Film.title='Interstellar' AND Film.year_of_production='2014'),
		(SELECT id_function FROM FunctionProfession WHERE FunctionProfession.profession='Director')

				
),
(
		('10'),
		(SELECT id_film FROM Film WHERE Film.title='Interstellar' AND Film.year_of_production='2014'),
		(SELECT id_function FROM FunctionProfession WHERE FunctionProfession.profession='Hair Stylist')

				
),

(
		('31'),
		(SELECT id_film FROM Film WHERE Film.title='Interstellar' AND Film.year_of_production='2014'),
		(SELECT id_function FROM FunctionProfession WHERE FunctionProfession.profession='Makeup Artist')

				
),
(
		('12'),
		(SELECT id_film FROM Film WHERE Film.title='Interstellar' AND Film.year_of_production='2014'),
		(SELECT id_function FROM FunctionProfession WHERE FunctionProfession.profession='Producer')

				
),
(
		('10'),
		(SELECT id_film FROM Film WHERE Film.title='Interstellar' AND Film.year_of_production='2014'),
		(SELECT id_function FROM FunctionProfession WHERE FunctionProfession.profession='Producer')

				
),

--Life is Beautiful

(
		('1'),
		(SELECT id_film FROM Film WHERE Film.title='Life is Beautiful' AND Film.year_of_production='2003'),
		(SELECT id_function FROM FunctionProfession WHERE FunctionProfession.profession='Actor')
		
),
(
		('23'),
		(SELECT id_film FROM Film WHERE Film.title='Life is Beautiful' AND Film.year_of_production='2003'),
		(SELECT id_function FROM FunctionProfession WHERE FunctionProfession.profession='Actor')
		
),
(
		('31'),
		(SELECT id_film FROM Film WHERE Film.title='Life is Beautiful' AND Film.year_of_production='2003'),
		(SELECT id_function FROM FunctionProfession WHERE FunctionProfession.profession='Actor')
		
),
(
		('20'),
		(SELECT id_film FROM Film WHERE Film.title='Life is Beautiful' AND Film.year_of_production='2003'),
		(SELECT id_function FROM FunctionProfession WHERE FunctionProfession.profession='Actor')
		
),
(
		('33'),
		(SELECT id_film FROM Film WHERE Film.title='Life is Beautiful' AND Film.year_of_production='2003'),
		(SELECT id_function FROM FunctionProfession WHERE FunctionProfession.profession='Actor')
			   	
),
(
		('35'),
		(SELECT id_film FROM Film WHERE Film.title='Life is Beautiful' AND Film.year_of_production='2003'),
		(SELECT id_function FROM FunctionProfession WHERE FunctionProfession.profession='Director')


		
),
(
		('47'),
		(SELECT id_film FROM Film WHERE Film.title='Life is Beautiful' AND Film.year_of_production='2003'),
		(SELECT id_function FROM FunctionProfession WHERE FunctionProfession.profession='Hair Stylist')
						
),

(
		('48'),
		(SELECT id_film FROM Film WHERE Film.title='Life is Beautiful' AND Film.year_of_production='2003'),
		(SELECT id_function FROM FunctionProfession WHERE FunctionProfession.profession='Director')

				
),
(
		('46'),
		(SELECT id_film FROM Film WHERE Film.title='Life is Beautiful' AND Film.year_of_production='2003'),
		(SELECT id_function FROM FunctionProfession WHERE FunctionProfession.profession='Hair Stylist')

				
),

(
		('45'),
		(SELECT id_film FROM Film WHERE Film.title='Life is Beautiful' AND Film.year_of_production='2003'),
		(SELECT id_function FROM FunctionProfession WHERE FunctionProfession.profession='Makeup Artist')

				
),
(
		('18'),
		(SELECT id_film FROM Film WHERE Film.title='Life is Beautiful' AND Film.year_of_production='2003'),
		(SELECT id_function FROM FunctionProfession WHERE FunctionProfession.profession='Producer')

				
),
(
		('17'),
		(SELECT id_film FROM Film WHERE Film.title='Life is Beautiful' AND Film.year_of_production='2003'),
		(SELECT id_function FROM FunctionProfession WHERE FunctionProfession.profession='Producer')

				
),

--Fight Club

(
		('10'),
		(SELECT id_film FROM Film WHERE Film.title='Fight Club' AND Film.year_of_production='1999'),
		(SELECT id_function FROM FunctionProfession WHERE FunctionProfession.profession='Actor')
		
),
(
		('37'),
		(SELECT id_film FROM Film WHERE Film.title='Fight Club' AND Film.year_of_production='1999'),
		(SELECT id_function FROM FunctionProfession WHERE FunctionProfession.profession='Actor')
		
),
(
		('36'),
		(SELECT id_film FROM Film WHERE Film.title='Fight Club' AND Film.year_of_production='1999'),
		(SELECT id_function FROM FunctionProfession WHERE FunctionProfession.profession='Actor')
		
),
(
		('42'),
		(SELECT id_film FROM Film WHERE Film.title='Fight Club' AND Film.year_of_production='1999'),
		(SELECT id_function FROM FunctionProfession WHERE FunctionProfession.profession='Actor')
		
),
(
		('41'),
		(SELECT id_film FROM Film WHERE Film.title='Fight Club' AND Film.year_of_production='1999'),
		(SELECT id_function FROM FunctionProfession WHERE FunctionProfession.profession='Actor')
			   	
),
(
		('44'),
		(SELECT id_film FROM Film WHERE Film.title='Fight Club' AND Film.year_of_production='1999'),
		(SELECT id_function FROM FunctionProfession WHERE FunctionProfession.profession='Director')


		
),
(
		('49'),
		(SELECT id_film FROM Film WHERE Film.title='Fight Club' AND Film.year_of_production='1999'),
		(SELECT id_function FROM FunctionProfession WHERE FunctionProfession.profession='Hair Stylist')
						
),

(
		('22'),
		(SELECT id_film FROM Film WHERE Film.title='Fight Club' AND Film.year_of_production='1999'),
		(SELECT id_function FROM FunctionProfession WHERE FunctionProfession.profession='Director')

				
),
(
		('22'),
		(SELECT id_film FROM Film WHERE Film.title='Fight Club' AND Film.year_of_production='1999'),
		(SELECT id_function FROM FunctionProfession WHERE FunctionProfession.profession='Sound Engineer')

				
),

(
		('18'),
		(SELECT id_film FROM Film WHERE Film.title='Fight Club' AND Film.year_of_production='1999'),
		(SELECT id_function FROM FunctionProfession WHERE FunctionProfession.profession='Makeup Artist')

				
),
(
		('6'),
		(SELECT id_film FROM Film WHERE Film.title='Fight Club' AND Film.year_of_production='1999'),
		(SELECT id_function FROM FunctionProfession WHERE FunctionProfession.profession='Camera Operator')

				
),
(
		('16'),
		(SELECT id_film FROM Film WHERE Film.title='Fight Club' AND Film.year_of_production='1999'),
		(SELECT id_function FROM FunctionProfession WHERE FunctionProfession.profession='Movie Editor')

				
),

--Memento

(
		('14'),
		(SELECT id_film FROM Film WHERE Film.title='Memento' AND Film.year_of_production='1980'),
		(SELECT id_function FROM FunctionProfession WHERE FunctionProfession.profession='Actor')
		
),
(
		('37'),
		(SELECT id_film FROM Film WHERE Film.title='Memento' AND Film.year_of_production='1980'),
		(SELECT id_function FROM FunctionProfession WHERE FunctionProfession.profession='Actor')
		
),
(
		('32'),
		(SELECT id_film FROM Film WHERE Film.title='Memento' AND Film.year_of_production='1980'),
		(SELECT id_function FROM FunctionProfession WHERE FunctionProfession.profession='Actor')
		
),
(
		('33'),
		(SELECT id_film FROM Film WHERE Film.title='Memento' AND Film.year_of_production='1980'),
		(SELECT id_function FROM FunctionProfession WHERE FunctionProfession.profession='Actor')
		
),
(
		('39'),
		(SELECT id_film FROM Film WHERE Film.title='Memento' AND Film.year_of_production='1980'),
		(SELECT id_function FROM FunctionProfession WHERE FunctionProfession.profession='Actor')
			   	
),
(
		('41'),
		(SELECT id_film FROM Film WHERE Film.title='Memento' AND Film.year_of_production='1980'),
		(SELECT id_function FROM FunctionProfession WHERE FunctionProfession.profession='Director')


		
),
(
		('43'),
		(SELECT id_film FROM Film WHERE Film.title='Memento' AND Film.year_of_production='1980'),
		(SELECT id_function FROM FunctionProfession WHERE FunctionProfession.profession='Hair Stylist')
						
),

(
		('23'),
		(SELECT id_film FROM Film WHERE Film.title='Memento' AND Film.year_of_production='1980'),
		(SELECT id_function FROM FunctionProfession WHERE FunctionProfession.profession='Director')

				
),
(
		('28'),
		(SELECT id_film FROM Film WHERE Film.title='Memento' AND Film.year_of_production='1980'),
		(SELECT id_function FROM FunctionProfession WHERE FunctionProfession.profession='Sound Engineer')

				
),

(
		('19'),
		(SELECT id_film FROM Film WHERE Film.title='Memento' AND Film.year_of_production='1980'),
		(SELECT id_function FROM FunctionProfession WHERE FunctionProfession.profession='Makeup Artist')

				
),
(
		('6'),
		(SELECT id_film FROM Film WHERE Film.title='Memento' AND Film.year_of_production='1980'),
		(SELECT id_function FROM FunctionProfession WHERE FunctionProfession.profession='Camera Operator')

				
),
(
		('7'),
		(SELECT id_film FROM Film WHERE Film.title='Memento' AND Film.year_of_production='1980'),
		(SELECT id_function FROM FunctionProfession WHERE FunctionProfession.profession='Movie Editor')

				
),

--Leviathan
(
		('1'),
		(SELECT id_film FROM Film WHERE Film.title='Leviathan' AND Film.year_of_production='2014'),
		(SELECT id_function FROM FunctionProfession WHERE FunctionProfession.profession='Actor')
		
),
(
		('2'),
		(SELECT id_film FROM Film WHERE Film.title='Leviathan' AND Film.year_of_production='2014'),
		(SELECT id_function FROM FunctionProfession WHERE FunctionProfession.profession='Actor')
		
),
(
		('3'),
		(SELECT id_film FROM Film WHERE Film.title='Leviathan' AND Film.year_of_production='2014'),
		(SELECT id_function FROM FunctionProfession WHERE FunctionProfession.profession='Actor')
		
),
(
		('4'),
		(SELECT id_film FROM Film WHERE Film.title='Leviathan' AND Film.year_of_production='2014'),
		(SELECT id_function FROM FunctionProfession WHERE FunctionProfession.profession='Actor')
		
),
(
		('5'),
		(SELECT id_film FROM Film WHERE Film.title='Leviathan' AND Film.year_of_production='2014'),
		(SELECT id_function FROM FunctionProfession WHERE FunctionProfession.profession='Actor')


		
),
(
		('3'),
		(SELECT id_film FROM Film WHERE Film.title='Leviathan' AND Film.year_of_production='2014'),
		(SELECT id_function FROM FunctionProfession WHERE FunctionProfession.profession='Director')


		
),
(
		('2'),
		(SELECT id_film FROM Film WHERE Film.title='Leviathan' AND Film.year_of_production='2014'),
		(SELECT id_function FROM FunctionProfession WHERE FunctionProfession.profession='Producer')

				
),
--SHawshank
(
		('10'),
		(SELECT id_film FROM Film WHERE Film.title='The Shawshank Redemption' AND Film.year_of_production='1994'),
		(SELECT id_function FROM FunctionProfession WHERE FunctionProfession.profession='Actor')
		
),
(
		('2'),
		(SELECT id_film FROM Film WHERE Film.title='The Shawshank Redemption' AND Film.year_of_production='1994'),
		(SELECT id_function FROM FunctionProfession WHERE FunctionProfession.profession='Actor')
		
),
(
		('12'),
		(SELECT id_film FROM Film WHERE Film.title='The Shawshank Redemption' AND Film.year_of_production='1994'),
		(SELECT id_function FROM FunctionProfession WHERE FunctionProfession.profession='Actor')
		
),
(
		('11'),
		(SELECT id_film FROM Film WHERE Film.title='The Shawshank Redemption' AND Film.year_of_production='1994'),
		(SELECT id_function FROM FunctionProfession WHERE FunctionProfession.profession='Actor')
		
),
(
		('8'),
		(SELECT id_film FROM Film WHERE Film.title='The Shawshank Redemption' AND Film.year_of_production='1994'),
		(SELECT id_function FROM FunctionProfession WHERE FunctionProfession.profession='Actor')
			   		
),
(
		('9'),
		(SELECT id_film FROM Film WHERE Film.title='The Shawshank Redemption' AND Film.year_of_production='1994'),
		(SELECT id_function FROM FunctionProfession WHERE FunctionProfession.profession='Director')
		
),
(
		('15'),
		(SELECT id_film FROM Film WHERE Film.title='The Shawshank Redemption' AND Film.year_of_production='1994'),
		(SELECT id_function FROM FunctionProfession WHERE FunctionProfession.profession='Producer')
			   		
),
(
		('17'),
		(SELECT id_film FROM Film WHERE Film.title='The Shawshank Redemption' AND Film.year_of_production='1994'),
		(SELECT id_function FROM FunctionProfession WHERE FunctionProfession.profession='Movie Editor')
		
),
-- Goodfellas
(
		('10'),
		(SELECT id_film FROM Film WHERE Film.title='Goodfellas' AND Film.year_of_production='1990'),
		(SELECT id_function FROM FunctionProfession WHERE FunctionProfession.profession='Actor')
		
),
(
		('23'),
		(SELECT id_film FROM Film WHERE Film.title='Goodfellas' AND Film.year_of_production='1990'),
		(SELECT id_function FROM FunctionProfession WHERE FunctionProfession.profession='Actor')
		
),
(
		('32'),
		(SELECT id_film FROM Film WHERE Film.title='Goodfellas' AND Film.year_of_production='1990'),
		(SELECT id_function FROM FunctionProfession WHERE FunctionProfession.profession='Actor')
		
),
(
		('24'),
		(SELECT id_film FROM Film WHERE Film.title='Goodfellas' AND Film.year_of_production='1990'),
		(SELECT id_function FROM FunctionProfession WHERE FunctionProfession.profession='Actor')
		
),
(
		('25'),
		(SELECT id_film FROM Film WHERE Film.title='Goodfellas' AND Film.year_of_production='1990'),
		(SELECT id_function FROM FunctionProfession WHERE FunctionProfession.profession='Actor')
			   	
),
(
		('21'),
		(SELECT id_film FROM Film WHERE Film.title='Goodfellas' AND Film.year_of_production='1990'),
		(SELECT id_function FROM FunctionProfession WHERE FunctionProfession.profession='Director')


		
),
(
		('32'),
		(SELECT id_film FROM Film WHERE Film.title='Goodfellas' AND Film.year_of_production='1990'),
		(SELECT id_function FROM FunctionProfession WHERE FunctionProfession.profession='Producer')

				
),

(
		('32'),
		(SELECT id_film FROM Film WHERE Film.title='Goodfellas' AND Film.year_of_production='1990'),
		(SELECT id_function FROM FunctionProfession WHERE FunctionProfession.profession='Advertiser')

				
),
(
		('32'),
		(SELECT id_film FROM Film WHERE Film.title='Goodfellas' AND Film.year_of_production='1990'),
		(SELECT id_function FROM FunctionProfession WHERE FunctionProfession.profession='Designer')

				
),
--Witness for the prosecution
(
		('11'),
		(SELECT id_film FROM Film WHERE Film.title='Witness for the Prosecution' AND Film.year_of_production='1954'),
		(SELECT id_function FROM FunctionProfession WHERE FunctionProfession.profession='Actor')
		
),
(
		('27'),
		(SELECT id_film FROM Film WHERE Film.title='Witness for the Prosecution' AND Film.year_of_production='1954'),
		(SELECT id_function FROM FunctionProfession WHERE FunctionProfession.profession='Actor')
		
),
(
		('50'),
		(SELECT id_film FROM Film WHERE Film.title='Witness for the Prosecution' AND Film.year_of_production='1954'),
		(SELECT id_function FROM FunctionProfession WHERE FunctionProfession.profession='Actor')
		
),
(
		('29'),
		(SELECT id_film FROM Film WHERE Film.title='The Godfather' AND Film.year_of_production='1972'),
		(SELECT id_function FROM FunctionProfession WHERE FunctionProfession.profession='Actor')
		
),
(
		('42'),
		(SELECT id_film FROM Film WHERE Film.title='Witness for the Prosecution' AND Film.year_of_production='1954'),
		(SELECT id_function FROM FunctionProfession WHERE FunctionProfession.profession='Actor')
			   	
),
(
		('41'),
		(SELECT id_film FROM Film WHERE Film.title='Witness for the Prosecution' AND Film.year_of_production='1954'),
		(SELECT id_function FROM FunctionProfession WHERE FunctionProfession.profession='Director')


		
),
(
		('10'),
		(SELECT id_film FROM Film WHERE Film.title='Witness for the Prosecution' AND Film.year_of_production='1954'),
		(SELECT id_function FROM FunctionProfession WHERE FunctionProfession.profession='Producer')

				
),

(
		('3'),
		(SELECT id_film FROM Film WHERE Film.title='Witness for the Prosecution' AND Film.year_of_production='1954'),
		(SELECT id_function FROM FunctionProfession WHERE FunctionProfession.profession='Advertiser')

				
),
(
		('4'),
		(SELECT id_film FROM Film WHERE Film.title='Witness for the Prosecution' AND Film.year_of_production='1954'),
		(SELECT id_function FROM FunctionProfession WHERE FunctionProfession.profession='Designer')

				
),

--Schilder''s List
(
		('13'),
		(SELECT id_film FROM Film WHERE Film.title='Schilder''s List' AND Film.year_of_production='1993'),
		(SELECT id_function FROM FunctionProfession WHERE FunctionProfession.profession='Actor')
		
),
(
		('29'),
		(SELECT id_film FROM Film WHERE Film.title='Schilder''s List' AND Film.year_of_production='1993'),
		(SELECT id_function FROM FunctionProfession WHERE FunctionProfession.profession='Actor')
		
),
(
		('32'),
		(SELECT id_film FROM Film WHERE Film.title='Schilder''s List' AND Film.year_of_production='1993'),
		(SELECT id_function FROM FunctionProfession WHERE FunctionProfession.profession='Actor')
		
),
(
		('34'),
		(SELECT id_film FROM Film WHERE Film.title='Schilder''s List' AND Film.year_of_production='1993'),
		(SELECT id_function FROM FunctionProfession WHERE FunctionProfession.profession='Actor')
		
),
(
		('33'),
		(SELECT id_film FROM Film WHERE Film.title='Schilder''s List' AND Film.year_of_production='1993'),
		(SELECT id_function FROM FunctionProfession WHERE FunctionProfession.profession='Actor')
			   	
),
(
		('21'),
		(SELECT id_film FROM Film WHERE Film.title='Schilder''s List' AND Film.year_of_production='1993'),
		(SELECT id_function FROM FunctionProfession WHERE FunctionProfession.profession='Director')


		
),
(
		('49'),
		(SELECT id_film FROM Film WHERE Film.title='Schilder''s List' AND Film.year_of_production='1993'),
		(SELECT id_function FROM FunctionProfession WHERE FunctionProfession.profession='Hair Stylist')
						
),

(
		('31'),
		(SELECT id_film FROM Film WHERE Film.title='Schilder''s List' AND Film.year_of_production='1993'),
		(SELECT id_function FROM FunctionProfession WHERE FunctionProfession.profession='Director')

				
),
(
		('10'),
		(SELECT id_film FROM Film WHERE Film.title='Schilder''s List' AND Film.year_of_production='1993'),
		(SELECT id_function FROM FunctionProfession WHERE FunctionProfession.profession='Hair Stylist')

				
),

(
		('31'),
		(SELECT id_film FROM Film WHERE Film.title='Schilder''s List' AND Film.year_of_production='1993'),
		(SELECT id_function FROM FunctionProfession WHERE FunctionProfession.profession='Makeup Artist')

				
),
(
		('12'),
		(SELECT id_film FROM Film WHERE Film.title='Schilder''s List' AND Film.year_of_production='1993'),
		(SELECT id_function FROM FunctionProfession WHERE FunctionProfession.profession='Producer')

				
),
(
		('10'),
		(SELECT id_film FROM Film WHERE Film.title='Schilder''s List' AND Film.year_of_production='1993'),
		(SELECT id_function FROM FunctionProfession WHERE FunctionProfession.profession='Producer')

				
),

--The Matrix

(
		('1'),
		(SELECT id_film FROM Film WHERE Film.title='The Matrix' AND Film.year_of_production='1999'),
		(SELECT id_function FROM FunctionProfession WHERE FunctionProfession.profession='Actor')
		
),
(
		('23'),
		(SELECT id_film FROM Film WHERE Film.title='The Matrix' AND Film.year_of_production='1999'),
		(SELECT id_function FROM FunctionProfession WHERE FunctionProfession.profession='Actor')
		
),
(
		('31'),
		(SELECT id_film FROM Film WHERE Film.title='The Matrix' AND Film.year_of_production='1999'),
		(SELECT id_function FROM FunctionProfession WHERE FunctionProfession.profession='Actor')
		
),
(
		('3'),
		(SELECT id_film FROM Film WHERE Film.title='The Matrix' AND Film.year_of_production='1999'),
		(SELECT id_function FROM FunctionProfession WHERE FunctionProfession.profession='Actor')
		
),
(
		('33'),
		(SELECT id_film FROM Film WHERE Film.title='The Matrix' AND Film.year_of_production='1999'),
		(SELECT id_function FROM FunctionProfession WHERE FunctionProfession.profession='Actor')
			   	
),
(
		('35'),
		(SELECT id_film FROM Film WHERE Film.title='The Matrix' AND Film.year_of_production='1999'),
		(SELECT id_function FROM FunctionProfession WHERE FunctionProfession.profession='Director')


		
),
(
		('47'),
		(SELECT id_film FROM Film WHERE Film.title='The Matrix' AND Film.year_of_production='1999'),
		(SELECT id_function FROM FunctionProfession WHERE FunctionProfession.profession='Hair Stylist')
						
),

(
		('48'),
		(SELECT id_film FROM Film WHERE Film.title='The Matrix' AND Film.year_of_production='1999'),
		(SELECT id_function FROM FunctionProfession WHERE FunctionProfession.profession='Director')

				
),
(
		('46'),
		(SELECT id_film FROM Film WHERE Film.title='The Matrix' AND Film.year_of_production='1999'),
		(SELECT id_function FROM FunctionProfession WHERE FunctionProfession.profession='Hair Stylist')

				
),

(
		('45'),
		(SELECT id_film FROM Film WHERE Film.title='The Matrix' AND Film.year_of_production='1999'),
		(SELECT id_function FROM FunctionProfession WHERE FunctionProfession.profession='Makeup Artist')

				
),
(
		('18'),
		(SELECT id_film FROM Film WHERE Film.title='The Matrix' AND Film.year_of_production='1999'),
		(SELECT id_function FROM FunctionProfession WHERE FunctionProfession.profession='Producer')

				
),
(
		('17'),
		(SELECT id_film FROM Film WHERE Film.title='The Matrix' AND Film.year_of_production='1999'),
		(SELECT id_function FROM FunctionProfession WHERE FunctionProfession.profession='Producer')

				
),

--The Dark Knight

(
		('10'),
		(SELECT id_film FROM Film WHERE Film.title='The Dark Knight' AND Film.year_of_production='2008'),
		(SELECT id_function FROM FunctionProfession WHERE FunctionProfession.profession='Actor')
		
),
(
		('37'),
		(SELECT id_film FROM Film WHERE Film.title='The Dark Knight' AND Film.year_of_production='2008'),
		(SELECT id_function FROM FunctionProfession WHERE FunctionProfession.profession='Actor')
		
),
(
		('36'),
		(SELECT id_film FROM Film WHERE Film.title='The Dark Knight' AND Film.year_of_production='2008'),
		(SELECT id_function FROM FunctionProfession WHERE FunctionProfession.profession='Actor')
		
),
(
		('42'),
		(SELECT id_film FROM Film WHERE Film.title='The Dark Knight' AND Film.year_of_production='2008'),
		(SELECT id_function FROM FunctionProfession WHERE FunctionProfession.profession='Actor')
		
),
(
		('41'),
		(SELECT id_film FROM Film WHERE Film.title='The Dark Knight' AND Film.year_of_production='2008'),
		(SELECT id_function FROM FunctionProfession WHERE FunctionProfession.profession='Actor')
			   	
),
(
		('44'),
		(SELECT id_film FROM Film WHERE Film.title='The Dark Knight' AND Film.year_of_production='2008'),
		(SELECT id_function FROM FunctionProfession WHERE FunctionProfession.profession='Director')


		
),
(
		('49'),
		(SELECT id_film FROM Film WHERE Film.title='The Dark Knight' AND Film.year_of_production='2008'),
		(SELECT id_function FROM FunctionProfession WHERE FunctionProfession.profession='Hair Stylist')
						
),

(
		('22'),
		(SELECT id_film FROM Film WHERE Film.title='The Dark Knight' AND Film.year_of_production='2008'),
		(SELECT id_function FROM FunctionProfession WHERE FunctionProfession.profession='Director')

				
),
(
		('22'),
		(SELECT id_film FROM Film WHERE Film.title='The Dark Knight' AND Film.year_of_production='2008'),
		(SELECT id_function FROM FunctionProfession WHERE FunctionProfession.profession='Sound Engineer')

				
),

(
		('18'),
		(SELECT id_film FROM Film WHERE Film.title='The Dark Knight' AND Film.year_of_production='2008'),
		(SELECT id_function FROM FunctionProfession WHERE FunctionProfession.profession='Makeup Artist')

				
),
(
		('6'),
		(SELECT id_film FROM Film WHERE Film.title='The Dark Knight' AND Film.year_of_production='2008'),
		(SELECT id_function FROM FunctionProfession WHERE FunctionProfession.profession='Camera Operator')

				
),
(
		('16'),
		(SELECT id_film FROM Film WHERE Film.title='The Dark Knight' AND Film.year_of_production='2008'),
		(SELECT id_function FROM FunctionProfession WHERE FunctionProfession.profession='Movie Editor')

				
),

--Intouchables

(
		('14'),
		(SELECT id_film FROM Film WHERE Film.title='Intouchables' AND Film.year_of_production='2011'),
		(SELECT id_function FROM FunctionProfession WHERE FunctionProfession.profession='Actor')
		
),
(
		('37'),
		(SELECT id_film FROM Film WHERE Film.title='Intouchables' AND Film.year_of_production='2011'),
		(SELECT id_function FROM FunctionProfession WHERE FunctionProfession.profession='Actor')
		
),
(
		('32'),
		(SELECT id_film FROM Film WHERE Film.title='Intouchables' AND Film.year_of_production='2011'),
		(SELECT id_function FROM FunctionProfession WHERE FunctionProfession.profession='Actor')
		
),
(
		('33'),
		(SELECT id_film FROM Film WHERE Film.title='Intouchables' AND Film.year_of_production='2011'),
		(SELECT id_function FROM FunctionProfession WHERE FunctionProfession.profession='Actor')
		
),
(
		('39'),
		(SELECT id_film FROM Film WHERE Film.title='Intouchables' AND Film.year_of_production='2011'),
		(SELECT id_function FROM FunctionProfession WHERE FunctionProfession.profession='Actor')
			   	
),
(
		('41'),
		(SELECT id_film FROM Film WHERE Film.title='Intouchables' AND Film.year_of_production='2011'),
		(SELECT id_function FROM FunctionProfession WHERE FunctionProfession.profession='Director')


		
),
(
		('43'),
		(SELECT id_film FROM Film WHERE Film.title='Intouchables' AND Film.year_of_production='2011'),
		(SELECT id_function FROM FunctionProfession WHERE FunctionProfession.profession='Hair Stylist')
						
),

(
		('23'),
		(SELECT id_film FROM Film WHERE Film.title='Intouchables' AND Film.year_of_production='2011'),
		(SELECT id_function FROM FunctionProfession WHERE FunctionProfession.profession='Director')

				
),
(
		('28'),
		(SELECT id_film FROM Film WHERE Film.title='Intouchables' AND Film.year_of_production='2011'),
		(SELECT id_function FROM FunctionProfession WHERE FunctionProfession.profession='Sound Engineer')

				
),

(
		('19'),
		(SELECT id_film FROM Film WHERE Film.title='Intouchables' AND Film.year_of_production='2011'),
		(SELECT id_function FROM FunctionProfession WHERE FunctionProfession.profession='Makeup Artist')

				
),
(
		('6'),
		(SELECT id_film FROM Film WHERE Film.title='Intouchables' AND Film.year_of_production='2011'),
		(SELECT id_function FROM FunctionProfession WHERE FunctionProfession.profession='Camera Operator')

				
),
(
		('7'),
		(SELECT id_film FROM Film WHERE Film.title='Intouchables' AND Film.year_of_production='2011'),
		(SELECT id_function FROM FunctionProfession WHERE FunctionProfession.profession='Movie Editor')

				
);

--INSERT REWARDING

USE filmsDB
--INSERT AWARDING


INSERT INTO Awarding(id_reward,id_function_of_person,awarding_year)
VALUES 
(       (SELECT id_reward FROM Reward WHERE Reward.reward_name ='AFA' and Reward.organisation='Asianet Film Awards'),
        (SELECT id_person_func_per_film FROM Person_func_per_film AS PFPF,Film AS F,Person AS P,FunctionProfession AS FP
		WHERE F.title='The Godfather' AND P.id_person='11' AND FP.profession='actor' 
		AND P.id_person=PFPF.id_person AND F.id_film=PFPF.id_film AND FP.id_function=PFPF.id_function),
        '1972'
),

(
(SELECT id_reward FROM Reward WHERE Reward.reward_name ='AVF' and Reward.organisation='Aval Viridugal Function'),
        (SELECT id_person_func_per_film FROM Person_func_per_film AS PFPF,Film AS F,Person AS P,FunctionProfession AS FP
		WHERE F.title='Intouchables' AND P.id_person='6' AND FP.profession='Camera Operator' 
		AND P.id_person=PFPF.id_person AND F.id_film=PFPF.id_film AND FP.id_function=PFPF.id_function),
        '2014'
),
(
		(SELECT id_reward FROM Reward WHERE Reward.reward_name ='CMA' and Reward.organisation='CineMAA Awards'),
        (SELECT id_person_func_per_film FROM Person_func_per_film AS PFPF,Film AS F,Person AS P,FunctionProfession AS FP
		WHERE F.title='The Dark Knight' AND P.id_person='18' AND FP.profession='Makeup Artist' 
		AND P.id_person=PFPF.id_person AND F.id_film=PFPF.id_film AND FP.id_function=PFPF.id_function),
        '2008'
),
(
		(SELECT id_reward FROM Reward WHERE Reward.reward_name ='ETA' and Reward.organisation='Edison Tamil Awards'),
        (SELECT id_person_func_per_film FROM Person_func_per_film AS PFPF,Film AS F,Person AS P,FunctionProfession AS FP
		WHERE F.title='Intouchables' AND P.id_person='23' AND FP.profession='Director' 
		AND P.id_person=PFPF.id_person AND F.id_film=PFPF.id_film AND FP.id_function=PFPF.id_function),
        '2014'
),
(
		(SELECT id_reward FROM Reward WHERE Reward.reward_name ='DPA' and Reward.organisation='Dadasaheb Phalke Award'),
        (SELECT id_person_func_per_film FROM Person_func_per_film AS PFPF,Film AS F,Person AS P,FunctionProfession AS FP
		WHERE F.title='The Matrix' AND P.id_person='17' AND FP.profession='Producer' 
		AND P.id_person=PFPF.id_person AND F.id_film=PFPF.id_film AND FP.id_function=PFPF.id_function),
        '1999'
),
(
		(SELECT id_reward FROM Reward WHERE Reward.reward_name ='FA' and Reward.organisation='Filmfare Awards'),
        (SELECT id_person_func_per_film FROM Person_func_per_film AS PFPF,Film AS F,Person AS P,FunctionProfession AS FP
		WHERE F.title='The Matrix' AND P.id_person='48' AND FP.profession='Director' 
		AND P.id_person=PFPF.id_person AND F.id_film=PFPF.id_film AND FP.id_function=PFPF.id_function),
        '1999'
),
(
		(SELECT id_reward FROM Reward WHERE Reward.reward_name ='FAE' and Reward.organisation='Filmfare Awards East'),
        (SELECT id_person_func_per_film FROM Person_func_per_film AS PFPF,Film AS F,Person AS P,FunctionProfession AS FP
		WHERE F.title='The Matrix' AND P.id_person='31' AND FP.profession='Actor' 
		AND P.id_person=PFPF.id_person AND F.id_film=PFPF.id_film AND FP.id_function=PFPF.id_function),
        '1999'
),
(
		(SELECT id_reward FROM Reward WHERE Reward.reward_name ='FAS' and Reward.organisation='Filmfare Awards South'),
        (SELECT id_person_func_per_film FROM Person_func_per_film AS PFPF,Film AS F,Person AS P,FunctionProfession AS FP
		WHERE F.title='Schilder''s List' AND P.id_person='13' AND FP.profession='Actor' 
		AND P.id_person=PFPF.id_person AND F.id_film=PFPF.id_film AND FP.id_function=PFPF.id_function),
        '1993'
),
(
		(SELECT id_reward FROM Reward WHERE Reward.reward_name ='FAS' and Reward.organisation='Filmfare Awards South'),
        (SELECT id_person_func_per_film FROM Person_func_per_film AS PFPF,Film AS F,Person AS P,FunctionProfession AS FP
		WHERE F.title='Schilder''s List' AND P.id_person='12' AND FP.profession='Producer' 
		AND P.id_person=PFPF.id_person AND F.id_film=PFPF.id_film AND FP.id_function=PFPF.id_function),
        '1993'
),

(
		(SELECT id_reward FROM Reward WHERE Reward.reward_name ='FSFA' and Reward.organisation='Filmfare Short Film Awards'),
        (SELECT id_person_func_per_film FROM Person_func_per_film AS PFPF,Film AS F,Person AS P,FunctionProfession AS FP
		WHERE F.title='Schilder''s List' AND P.id_person='31' AND FP.profession='Director' 
		AND P.id_person=PFPF.id_person AND F.id_film=PFPF.id_film AND FP.id_function=PFPF.id_function),
        '1993'
),
(
		(SELECT id_reward FROM Reward WHERE Reward.reward_name ='IIFA' and Reward.organisation='IIFA Utsavam'),
        (SELECT id_person_func_per_film FROM Person_func_per_film AS PFPF,Film AS F,Person AS P,FunctionProfession AS FP
		WHERE F.title='Schilder''s List' AND P.id_person='33' AND FP.profession='actor' 
		AND P.id_person=PFPF.id_person AND F.id_film=PFPF.id_film AND FP.id_function=PFPF.id_function),
        '1993'
),
(
		(SELECT id_reward FROM Reward WHERE Reward.reward_name ='IIFA' and Reward.organisation='IIFA Utsavam'),
        (SELECT id_person_func_per_film FROM Person_func_per_film AS PFPF,Film AS F,Person AS P,FunctionProfession AS FP
		WHERE F.title='Witness for the Prosecution' AND P.id_person='27' AND FP.profession='actor' 
		AND P.id_person=PFPF.id_person AND F.id_film=PFPF.id_film AND FP.id_function=PFPF.id_function),
        '1954'
),
(
		(SELECT id_reward FROM Reward WHERE Reward.reward_name ='IIFA' and Reward.organisation='IIFA Utsavam'),
        (SELECT id_person_func_per_film FROM Person_func_per_film AS PFPF,Film AS F,Person AS P,FunctionProfession AS FP
		WHERE F.title='Witness for the Prosecution' AND P.id_person='50' AND FP.profession='actor' 
		AND P.id_person=PFPF.id_person AND F.id_film=PFPF.id_film AND FP.id_function=PFPF.id_function),
        '1954'
),
(
		(SELECT id_reward FROM Reward WHERE Reward.reward_name ='KSFA' and Reward.organisation='Karnataka State Film Award'),
        (SELECT id_person_func_per_film FROM Person_func_per_film AS PFPF,Film AS F,Person AS P,FunctionProfession AS FP
		WHERE F.title='Goodfellas' AND P.id_person='32' AND FP.profession='Designer' 
		AND P.id_person=PFPF.id_person AND F.id_film=PFPF.id_film AND FP.id_function=PFPF.id_function),
        '1990'
),
(
		(SELECT id_reward FROM Reward WHERE Reward.reward_name ='OSFA' and Reward.organisation='Odisha State Film Awards'),
        (SELECT id_person_func_per_film FROM Person_func_per_film AS PFPF,Film AS F,Person AS P,FunctionProfession AS FP
		WHERE F.title='Goodfellas' AND P.id_person='32' AND FP.profession='Producer' 
		AND P.id_person=PFPF.id_person AND F.id_film=PFPF.id_film AND FP.id_function=PFPF.id_function),
        '1990'
),
(
		(SELECT id_reward FROM Reward WHERE Reward.reward_name ='PCA' and Reward.organisation='Prag Cine Awards'),
        (SELECT id_person_func_per_film FROM Person_func_per_film AS PFPF,Film AS F,Person AS P,FunctionProfession AS FP
		WHERE F.title='Goodfellas' AND P.id_person='32' AND FP.profession='Producer' 
		AND P.id_person=PFPF.id_person AND F.id_film=PFPF.id_film AND FP.id_function=PFPF.id_function),
        '1990'
),
(
		(SELECT id_reward FROM Reward WHERE Reward.reward_name ='RFF' and Reward.organisation='Rajasthan Film Festival'),
        (SELECT id_person_func_per_film FROM Person_func_per_film AS PFPF,Film AS F,Person AS P,FunctionProfession AS FP
		WHERE F.title='The Shawshank Redemption' AND P.id_person='2' AND FP.profession='Actor' 
		AND P.id_person=PFPF.id_person AND F.id_film=PFPF.id_film AND FP.id_function=PFPF.id_function),
        '1994'
),
(
		(SELECT id_reward FROM Reward WHERE Reward.reward_name ='RFTF' and Reward.organisation='RED FM Tulu Film Awards'),
        (SELECT id_person_func_per_film FROM Person_func_per_film AS PFPF,Film AS F,Person AS P,FunctionProfession AS FP
		WHERE F.title='The Shawshank Redemption' AND P.id_person='10' AND FP.profession='Actor' 
		AND P.id_person=PFPF.id_person AND F.id_film=PFPF.id_film AND FP.id_function=PFPF.id_function),
        '1995'
),
(
		(SELECT id_reward FROM Reward WHERE Reward.reward_name ='RFTF' and Reward.organisation='RED FM Tulu Film Awards'),
        (SELECT id_person_func_per_film FROM Person_func_per_film AS PFPF,Film AS F,Person AS P,FunctionProfession AS FP
		WHERE F.title='Leviathan' AND P.id_person='2' AND FP.profession='Producer' 
		AND P.id_person=PFPF.id_person AND F.id_film=PFPF.id_film AND FP.id_function=PFPF.id_function),
        '2014'
),


(
		(SELECT id_reward FROM Reward WHERE Reward.reward_name ='AFA' and Reward.organisation='Asianet Film Awards'),
        (SELECT id_person_func_per_film FROM Person_func_per_film AS PFPF,Film AS F,Person AS P,FunctionProfession AS FP
		WHERE F.title='Memento' AND P.id_person='28' AND FP.profession='Sound Engineer' 
		AND P.id_person=PFPF.id_person AND F.id_film=PFPF.id_film AND FP.id_function=PFPF.id_function),
        '1980'
),
(
		(SELECT id_reward FROM Reward WHERE Reward.reward_name ='SFA' and Reward.organisation='Santosham Film Awards'),
        (SELECT id_person_func_per_film FROM Person_func_per_film AS PFPF,Film AS F,Person AS P,FunctionProfession AS FP
		WHERE F.title='Fight Club' AND P.id_person='16' AND FP.profession='Movie Editor' 
		AND P.id_person=PFPF.id_person AND F.id_film=PFPF.id_film AND FP.id_function=PFPF.id_function),
        '1999'
),
(
		(SELECT id_reward FROM Reward WHERE Reward.reward_name ='SA' and Reward.organisation='Screen Awards'),
        (SELECT id_person_func_per_film FROM Person_func_per_film AS PFPF,Film AS F,Person AS P,FunctionProfession AS FP
		WHERE F.title='Interstellar' AND P.id_person='10' AND FP.profession='Producer' 
		AND P.id_person=PFPF.id_person AND F.id_film=PFPF.id_film AND FP.id_function=PFPF.id_function),
        '2014'
),
(
		(SELECT id_reward FROM Reward WHERE Reward.reward_name ='SA' and Reward.organisation='Screen Awards'),
        (SELECT id_person_func_per_film FROM Person_func_per_film AS PFPF,Film AS F,Person AS P,FunctionProfession AS FP
		WHERE F.title='Life is Beautiful' AND P.id_person='47' AND FP.profession='Hair Stylist' 
		AND P.id_person=PFPF.id_person AND F.id_film=PFPF.id_film AND FP.id_function=PFPF.id_function),
        '2003'


),
(
		(SELECT id_reward FROM Reward WHERE Reward.reward_name ='SA' and Reward.organisation='Screen Awards'),
        (SELECT id_person_func_per_film FROM Person_func_per_film AS PFPF,Film AS F,Person AS P,FunctionProfession AS FP
		WHERE F.title='Seven Samurai' AND P.id_person='25' AND FP.profession='Actor' 
		AND P.id_person=PFPF.id_person AND F.id_film=PFPF.id_film AND FP.id_function=PFPF.id_function),
        '2008'
),
(
		(SELECT id_reward FROM Reward WHERE Reward.reward_name ='SA' and Reward.organisation='Screen Awards'),
        (SELECT id_person_func_per_film FROM Person_func_per_film AS PFPF,Film AS F,Person AS P,FunctionProfession AS FP
		WHERE F.title='Seven Samurai' AND P.id_person='21' AND FP.profession='Director' 
		AND P.id_person=PFPF.id_person AND F.id_film=PFPF.id_film AND FP.id_function=PFPF.id_function),
        '2008'
);

--Additional information

INSERT INTO Additional_information (id_function_per_film,attrib_name,attrib_value)
VALUES
('1','role','Actor_role1'),
('2','role','Actor_role2'),
('3','role','Actor_role3'),
('4','role','Actor_role4'),
('5','role','Actor_role5'),
('6','role','Actor_role6'),
('7','role','Actor_role7'),
('8','role','Actor_role8'),
('9','role','Actor_role9'),
('10','role','Actor_role10'),
('11','role','Actor_role11'),
('12','role','Actor_role12'),
('16','role','Actor_role13'),
('17','role','Actor_role14'),
('18','role','Actor_role15'),
('19','role','Actor_role16'),
('20','role','Actor_role17'),
('25','role','Actor_role18'),
('26','role','Actor_role19'),
('27','role','Actor_role20'),
('28','role','Actor_role21'),
('29','role','Actor_role22'),
('34','role','Actor_role23'),
('35','role','Actor_role24'),
('36','role','Actor_role25'),
('37','role','Actor_role26'),
('38','role','Actor_role27'),
('46','role','Actor_role28'),
('47','role','Actor_role29'),
('48','role','Actor_role30'),
('49','role','Actor_role31'),
('50','role','Actor_role32'),
('58','role','Actor_role33'),
('59','role','Actor_role34'),
('60','role','Actor_role35'),
('61','role','Actor_role36'),
('62','role','Actor_role37'),
('70','role','Actor_role38'),
('71','role','Actor_role39'),
('72','role','Actor_role40'),
('73','role','Actor_role41'),
('74','role','Actor_role42'),
('82','role','Actor_role43'),
('83','role','Actor_role44'),
('84','role','Actor_role45'),
('85','role','Actor_role46'),
('86','role','Actor_role47'),
('89','role','Actor_role48'),
('90','role','Actor_role49'),
('91','role','Actor_role50'),
('92','role','Actor_role51'),
('93','role','Actor_role52'),
('97','role','Actor_role53'),
('98','role','Actor_role54'),
('99','role','Actor_role55'),
('100','role','Actor_role56'),
('101','role','Actor_role57'),
('106','role','Actor_role58'),
('107','role','Actor_role59'),
('108','role','Actor_role60'),
('109','role','Actor_role61'),
('110','role','Actor_role62'),
('115','role','Actor_role63'),
('116','role','Actor_role64'),
('117','role','Actor_role65'),
('118','role','Actor_role66'),
('119','role','Actor_role67'),
('127','role','Actor_role68'),
('128','role','Actor_role69'),
('129','role','Actor_role70'),
('130','role','Actor_role71'),
('131','role','Actor_role72'),
('139','role','Actor_role73'),
('140','role','Actor_role74'),
('141','role','Actor_role75'),
('142','role','Actor_role76'),
('143','role','Actor_role1'),
('151','role','Actor_role1'),
('152','role','Actor_role2'),
('153','role','Actor_role3'),
('154','role','Actor_role3'),
('155','role','Actor_role3')