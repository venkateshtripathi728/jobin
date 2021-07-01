# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'open-uri'
require 'nokogiri'
require "faker"
require 'clearbit'

Clearbit.key = 'sk_3a50b0c299438818f2c6c6a6cb343e5c'

alpha = ("a".."z").to_a
@organizations = []
alpha.each do |letter|
  url = "https://autocomplete.clearbit.com/v1/companies/suggest?query=:#{letter}"
  user_serialized = URI.open(url).read
  companies = JSON.parse(user_serialized)
  companies.each do |company|
  @organization = Organization.create!(name:company["name"],description: company["domain"], logo: company["logo"], category: Faker::Company.industry)
  @organizations << @organization
end
end

reviews=["The people are great to work with","There is lower compensation than expected","The people are great to work with, good perks.","Wide variety in experience based on team.","Good managers, benefits , some support, nice atmosphere","Long hours, far locations, a lot of work","Really fun work environment with startup","Really no down sides that I saw.","Awesome job environment to work in","Pressure is there for some parts","I like and learned from the beginning accounting","High clerical work in the Sane record","Very inspiring engineers to work with.","Easy to get lost, as it is such a big company.","The people are awesome. Lots of perks. Reduce administrative burdens. The food is great. There's a wide variety of tasks.","There's sometimes too wide a variety of things you can work on.","So many brilliant people Tons of resources Working on amazingly cool technologies Great culture - they really care about employees, actively ask for feedback, and act on it (e.g. Set corporate OKR's to improve on problem issues)","Becoming highly bureaucratic Growing political back stabbing, especially at the senior management levels","Google is one of the beast Company in the world","You have to work hard","Better than average engineers. Competitive compensation.","Big and beurocratic. Lots of legacy systems. Moves slowly.","The best company I've worked for. Culture, perks, the way people are treated. Very thankful for this experience.","Set hours for breakfast, lunch, dinner.","Easy place and people are nice","Employee will require muti-tasking to complete the job","Amazing compensation + benefits (hard to beat in Seattle), office space is cozy. Lots of autonomy. Taking initiative on important things is heavily rewarded.","Growing pains as Google has gone from ~10k to ~100k FTE during my tenure. Processes have mostly scaled, but internal trust and culture have not.","Ambitious mission, great colleagues, supportive atmosphere.","Everyone is eager to succeed, which can lead to a pretty competitive environment.","Good opportunities for different technical experiences, good work-life balance, good compensation, great coworkers","Difficult to advance depending on which projects you're contributing to","Employees, food, benefits, perks, shuttle, basically an all-expenses-paid college.","Company has become way too vertical, performance evaluations are no longer representative and have arbitrary 'unwritten rules' that contradict written rules.","food, shuttle, technology, perks, health, 401K, brand","Great place to work finace is backend though. Its a tech company first.","Pays really well Free food Looks good on resume","Google wants 60-hour weeks. If you have a 150 IQ, Google is okay with 50-hour weeks, otherwise, 60-hour weeks are required to keep your job. Work is mind-numbingly boring, e.g. sustaining software written 10-20 years ago, mostly. Culture is declining QUICKLY Too many people are competing for your job so Google has CS PhDs doing plumbing work.","Pretty good benifits and bank.","Being challanged everyday. Having no life.","great work culture , good for starters","long hours can be unreasonable","Great pay Great work life balance Great perks/benefits Nice people","Very few, work sometimes monotonous.","comfortable environment, free food, nice people","difficult to promote in google","Great company with creative ideas.","No cons at this point.","Here you receive a great opportunity to solve worthwhile problems with outstanding teammates  Great benefits, great pay","There's the danger of getting too familiar and comfortable with the internal tooling that you lose touch with the tools & trends of greater software engineering community -- it's like a bubble",
"Great benefits, work life balance, and pay for the position.","Company is so large that it can be hard to make any vertical movement.","Resume filler gets you easy interviews everywhere once you have it","Expensive city Hard to switch teams","Google offers the best of the best when it comes to company culture.","I cannot think of anything wrong at Google","Great place to work at every single day","Nothing bad to say. Loved this place.","* Good pay * Free food * Good hours * Easy work","* No new stock award for (most) first year employees. May take up to two years. * Contributions of new employees undervalued. Expect a bad review score your first performance cycle, regardless of actual performance.","Great culture, great people, great benefits","Bad management, very political and turning into a bureaucratic culture","fun, good food, smart people","busy, stressful, sometimes disorganized, hectic","Intellectually stimulating place with many 'benefits'","I think the culture has lost its way. It's a shame.","Great benefits, 401K plan, PTO","crowded work environment, micro management","Great experience good people new challenges","Great amount of work that's it","Prod of working with awesome people","big company, less impact of daily work.","Too many to list here - all the standard google magic","standard growing pains with an expanding product portfolio","the place was nice and th people were too","not enough snacks, and a bit stress ful","Fantastic organization, training and development, opportunities to do meaningful work and benefits / perks.","Becoming more like an old-fashioned company.","Great people - high caliber. Fun environment","Hard to make impact as one of 60 000 people","Best culture Great values Friendly people Great perks","Big company, you get lost Fast paced and very competitive Imposter syndrome is real","Co-workers are really smart Challenging Work","Disingenuous performance review and calibration process Promotion process driving decision","company is very very good","nothing to say about this","Scale, values, ambitions. The company continues to be a strong innovator and technical leader.","Large company, process can be bureaucratic","Work life balance. Interesting work. Everything you need to stay focused. Best in class salary. Healthy work environment.","Things progress slowly compared to startups, other companies that believe in move fast break things!","Benefits, people, opportunities for growth, performance management, 360 degree reviews","Large corporation - standardization, spectrum of roles","Great place to work at","Have some improvements to make","Good place to start career with friendly coworkers and good benefits","Easy to feel like a cog in the wheel, ad-driven business model, internal mobility can be difficult","great minds, challenging work, felt sense of achievement after assignment completion","working on multiple projects can be distracting but it is a company need","Perks, food, spaces, culture, health care and work-life balance","Flat org, hard to grow","Excellent environment to work for","Office is too comfortable to work for","Free food, great culture, and talented colleagues","Things move a little bit slow","Supportive, Innovative, lots of intelligent people","Departments have poor communication, i.e. creative team and marketing team don't connect well.","O you have got to be kidding me.......","Is ran by a pack of 12 years old kids.........","It provides good work life balance","It is getting too big","Good environment, nice people, free stuff","Tough Environment, difficult process, hard work","Very very very nice people","Absolutely no cons to report","Dynamic and tech savvy teams","Long working hours. Xfn challenges. Many teams trying to solve the same problem, causes waste",
"Great Pay, Great Flexibility, Nice Coworkers,","None really other than constant work that we never seem to have enough time to complete.","Good pay, good environment, smart people","high housing price, heavy work load","New challenges everyday with some of the best technologies on earth","Keeping job title and pay correct","work life balance is good","growth is slow and complicated.","The culture - the people are amazing! Hands down some of the smartest people you'll ever work with","It can be very large and bureaucratic at times","Staff are kind, compassionate, and more importantly, they are willing to Google your questions for you. :)","Sometimes people decided to use Bing rather than Google, which made me shed quite more than just a few fragile teardrops.","Great benefits, awesome perks, smart people","Takes a long time to get things done","Best place to work and grow","It's getting too big and crowded","Good work environment is good for me.","I dont think there is any cons.","Rewarding, good teamwork, cool locations","Exhausting, Low pay, long commute, grunt work","good benefits. work life balance. low pressure","very political environment. too many layers. Communication overheads.","Good pay, benefits, and free food.","Spend more time sending emails than doing actual work.","everything is good at google","there is currently no cons at google","Great culture, pays well, balanced.","High living cost of the area","Very transparent company despite its size. Managers and colleagues help with your personal and career growth.","No real complaints. I wish I could've stayed.","Nice work environment with good mix of people","No such that I noticed","Overall, an unarguably fantastic place to work.","Little focus on retention, career development outside of one's org, or building transferrable skills. The larger the company grows, the more issues with defined roles, silos tend to manifest.","Great opportunities for personal growth","Fast paced and highly demanding","ceo, work life balance, projects","Sometimes interns were not given enough of an opinion","Massages, Perks, Food, cutting edge tech","Developers get too theoretical so we end up not delivering anything","Smart, collaborative people Good salary and benefits Welcoming culture","Hard to grow outside Mountain View","My dream in one time work in google and you gave me chance am try to best for google","Trying something new with google and sunder pichai","Diverse culture and set of opportunities.","Large corporation, very different businesses, original Google culture getting lost.","Tons of opportunity. Great people. Excellent perks. Fast-paced and autonomous.","Corporate hierarchy. Slow-moving HR. Growth boundaries that disregard exceptional performance/motivation.","Great culture, offices, benefits, people.","Working with execs requires long demanding hours (to be expected).","Love Marketing so much an have willing","Some stress but will reomove it","Great people, interesting work, great office space","Hardcore mentality, long hours, competitive culture","Compensation, benefits, and autonomy","Siloed environment at times","it is a good place to work","I have not find any issues","A consequence of the crazy hiring bar is that everyone you work with is very smart and you can rely on your teammates to get things done.","I guess some of the typical big company stuff, like it sometimes taking longer for a project to complete.","Everything is great and I liked it very much","no cons as such for this company","Excellent people, interesting work, free meals, amazing benefits.","Big companies have a larger overhead of process than small ones.","In addition to the amazing perks, Google was a really great environment to learn - there are tons of really smart people you can learn from.",
"Could be hard to advance in the company.","Has a great company atmosphere","I can not think of any!","Amazing perks atmosphere and chances to grow","Potential to drink the koolaid and loose sight of some realities","good culture but it's good","boring projects but it's fine","Good work environment for all people","The location of their office isnâ€™t my favorite","Competitive perks and pay, great work life balance","Large corporation with hard upward mobility","Very wide range of opportunities to work in.","Performance review process is very lengthy and in depth.","Innovation Problem scale Great people Work life balance","Nothing that I know of. I like working here","The food is good a lot.","The work is very hard.","Cross talk is excellent industry leading","Stressful atmosphere due to high level of competition","Good company to work and learn","Nothing to say against the job","Good working environment and facilities are awesome","You need to be very careful","Great perks, overall great people to work with. Open culture.","Variance in experience depending on which team you'll be joining. Engineering heavy","You are working with some of the smartest people. Great Perks and Pay Love the atmosphere","Not that I know of","Obvious, offices, perks, most of the people","Politics at upper levels. OKRs are outdated and Machiavellian","Company provides great benefit package with lots of time off.","Income is limited due to nature of how stores are managed (sales associates might make 35K gross minus taxes, benefits, etc. income of about 26K. ) managers paid salary but still sell and always have the best opportunity for walk in customers (store manager make 65K minimum). Great job for someone who just wants to earn a mediocre living, young person with not many responsibilities,","Good people. Benefits are good","nothing at this time may be in future","Good people dream job good place","Good food good salary respect","Work with good people Laid back environment Tons of benefits (free meals are great) Competitive compensation Solid internal products and tools","All of the internal tools make what you've learned less relevant if you want to leave","Very flexible working environment and friendly people to work with.","I cannot think of any downsides","Awesome job, nothing to complain about","Nothing really, the job was amazing","benefits, smart people, lots of interesting areas to work in","huge company with lots of process & red tape easy to feel lost in a large company like this one","Good pay and perks, respectful and friendly coworkers","Big company, hard to move functions","Work is challenging and enjoyable","Family Life suffers because of time commitment","You would be employed here for life","Not many I can think","It is a great company to work for because it is a technology oriented company.","It will be very hard to work for a different company after Google.","Great benefits. Smart people who are willing to help you.","Big company, not as big of an impact.","Salary, Culture, Food, 401k matching, Insurance, Perks","Not super easy to pick a great team when you start","Easy to understand the material","Too much info to deal with","They have good free food","There is a lot if work to do","Strong commitment to employee growth","Too much NIH syndrome. Lots of great work happening outside of Google","A lot of talent all around, very inspiring.","Getting too large to operate effectively.","Terrific mission. Inclusive culture. Great management. Ridiculous benefits and compensation.","Very big so it's sometimes hard to navigate the relationships.","perks and utility works just fine, if you like the free food and stuff","too many work and getting harder to be promoted","Cutting edge company, intelligent and friendly workforce, excellent salary and benefits.","Large campus size, high-stress environment, extraneous performance review metrics.",
"Great people and engineering culture","Feels more like an established company","Good! Nice! Free Food! Wonderful","bad!no, no bad things nice place","pretty really relly good food","lots and lots of work","Big 4 tech company, facebook and google best","Large company hard to be recognized","401k, many projects, free food","X x x x x","good people and good beneift","high working hour not work life balance","great food, great people, no bad bosses","nothing really. it is a little more corporate than they let on.","Extremely fun and low stress. Excellent pay. A little too good actually.","Workplace politics and power struggles","Great perks, great food and 95% of the people are very friendly. Google seems to really care about the employees and their happiness . They also are big on recycling and taking care of the planet","5% of the employees are extremely rude unless you have a good position. They make rude remarks and do not have any manners.","Smart people, lots of opportunities to work on a variety of technical projects, great culture.","Can feel like a small cog in a big machine.","Googlers are great to work with, the company seems to care.","It's grown from a quirky small company to a corporat'ish behemoth.","Be happy and smile life is short","Happy,positive ,never late,have fun,customer always first","easy, leisure time, high salary, flexible working time","too many people, may be hard to get promoted over years","Friendly, welcoming atmosphere to work in.","Demanding hours, inconsistent management of matters.","Great food, great ad platform.","Too rigid a promotion path with arbitrary levels. Lacks meritocracy - much more about self-promotion.","Great pay, perks, people, projects","Slow progress, politics, development velocity","Good attitude hard working envirnment","Fluid ever changing projects and team","well balanced, good job in general","no con about position or job","Pay and other benefits you get","Work is work, not fun","Perks and benefits, free food and gym","Poor management with no people's skills","Continually impressed by the opportunities and value","Commute is tough, constantly in a â€œperformance managementâ€ mindset","Challenging work with opportunity to influence major business outcomes.","Extremely competitive culture. Work is never ending.","Very friendly work environment. I was certainly treated well by all other employees.","I felt my opinion was not considered very strongly amongst management. I suppose this could be expected.","The pay is pretty good","Apparently they cant get crabby patties for lunch","strong compensation packet, high mobility with the company that gives a lot of opportunities for growth","more than necessary re-orgs complete lack of work/life balance if desire to make impact","good atmosphere overall good job","i don't have any to mention","free food, healthy culture and environment","less base salary in the early career years","Great food and environment. Nice perks.","Too many smart people. Under utilized.","Smart colleagues, diverse areas, good perks","Becoming a large company in terms of blockers for innovation","free food, free gym, and free snacks","bureaucratic, engineers do not have visibility on priority","Work with great, smart people","No cons that I can think of","I could be of great yse","I do get side tracked alot","Best Teaching Job in America","The Bay Area is very expensive, especially for Educators.","Good people good food good times","There are no cons come on I mean it's google","- The compensation is good. Medical, dental, vision coverage, 401k matching are all pretty good. - Lots of perks on-site. Snacks, hot meals, gym, etc. - Talented and supportive co-workers and team mates.","- Lots of re-structuring: the team, the department, the organization within Google that you're working with might get shuffled around quite frequently to serve shifting priorities within the organization or the company.",
"Decent pay, great way to elevate career. Perks of Google","No guarantee of a job after 26 months.","Everything in the environment is fun, everyone is nice and helpful, there are experts on every field imaginable and are happy to assist and have time for you","Things can move slowly at times, people sometimes work on 'wrong things' to optimize for promotion committees","great benefits and environment to work in","long hours and the workload can be tough if you are not prepared for it","This is a fast paced environment with a great team across the country. You get to work with cross functional teams to gain an understanding of every aspect of the company. Everyone has a different background that develops a well rounded team.","There is a 2 year contract limit and if you would like to come back you have to wait at least 6 months to return.","Great learning opportunities with a good work/life balance. Everyone is passionate about what they work on.","Culture can vary a lot from a team to another team.","Great culture and fantastic people.","High growth rates have lead to some inefficient processes.","Great Company to work for.","I didnt have any cons, love this place.","Great team culture and perks","Work life balance is not great depending on the season","Founders still participate in running the company and share their vision","'Don't be evil' is sometimes forgotten","Great culture in the company","Constant reorganization creates confusion between departments","They take good care of employees, great insurance, free food","Working out the kinks that come with exponential growth","Great place to work and terrific people","Lots of talented people means standing out can be harder","the pay is just amazing","work hours is too much","Good work environment, great peers. Excellent benefits and compensation.","Walking fine line for promotions, merciless weeding out slow growers. Bad for mothers in terms of life/work balance. Spaces are crammed.","Good at solving technical problems Works hard","Lazy at time lack of communication",
 ]

i=1
20.times do 
  @user = User.create!(linkedin_url: Faker::Internet.url, email: "user#{i}@mail.fr",
  password: "azerty",first_name: Faker::Name.first_name,last_name:Faker::Name.last_name)
  file = URI.open(Faker::Avatar.image)
  @user.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png')
  i+=1  
    5.times do
    @organization= @organizations.sample
      2.times do
      @apply = Apply.create!(job_title: Faker::Company.profession, description:"Looking for a full-time permanent person, based in our main office. Reporting to the Head of the department, you will be part of the global team (7 members worldwide). You will be mainly responsible your region full-time.• 1-2 years of experience with proven results
      •	Bachelor's degree required
      •	Experience with a softwares
      •	Knowledge of/expertise in Gsuite, Office 365, Slack
      •	Proficiency with Windows and Mac OS X operating systems
      ",status:["Ready to apply","Applied", "Ongoing process","Waiting for answer"].sample,user_id:@user.id,organization_id: @organization.id, location: Faker::Nation.capital_city, updatedate: Faker::Date.between(from: '2021-07-01', to: '2014-07-01'))
      @interview1 = Interview.create!(date: Faker::Date.between(from: '2021-07-01', to: '2014-07-01') ,start_time:Faker::Time.between(from: DateTime.now - 1, to: DateTime.now) , end_time: Faker::Time.between(from: DateTime.now - 1, to: DateTime.now),step: "HR call", notes:"30 min HR call about motivations, answer expected next week",apply_id:@apply.id)
      @interview2 = Interview.create!(date: Faker::Date.between(from: '2021-07-01', to: '2014-07-01') ,start_time:Faker::Time.between(from: DateTime.now - 1, to: DateTime.now) , end_time: Faker::Time.between(from: DateTime.now - 1, to: DateTime.now),step: "Interview 1", notes:"Video interview with a manager, small business case and contextual exercise",apply_id:@apply.id)
      @review = Review.create!(interview_id: @interview1.id, comment: reviews.sample, rating: (1..10).to_a.sample,votes:(10..50).to_a.sample)
      @review = Review.create!(interview_id: @interview2.id, comment: reviews.sample, rating: (1..10).to_a.sample,votes:(10..50).to_a.sample)
      end
    end

end

4.times do
  @articles = Article.create!(tile: Faker::Movie.title, content: Faker::Quote.famous_last_words, author: Faker::Music::RockBand.name)
end

