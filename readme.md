#Updated

The back-end for the updated app (http://updatedapp.github.io/). It allows users to create their own news website by means of scraping content curators and sources. 

###Setting Up

1. Clone the repository: `https://github.com/anchetaWern/updated.git`
2. Execute `composer install` to install the dependencies.
3. Setup the database
4. Add the `.env`, `config/github.php`, `config/twitter.php` file.
5. Add the following to cron: `* * * * * php /path/to/cloned_project/artisan schedule:run >$` This runs `php artisan schedule:run` every minute. If there are any task scheduled at the current minute then it will run. Currently there's no setting for when to run the task for generating the static site. But you can update it on `app/Console/Kernel.php` directly.

If you want to host your news site on Github:

1. Create a new github account
2. [Generate ssh key](https://help.github.com/articles/generating-ssh-keys/)
3. Configure github user: `git config user.name "your name" and git config user.email "youremail@mail.com"`
4. Create new repository using the following format: `githubusername.github.io`.

Currently only github is supported. If you want to push to ftp you can check out this project: [git-ftp](http://git-ftp.github.io/git-ftp/) and modify the code in `app/Console/Commands/UpdateSIte.php` to use git-ftp instead.

###How it Works

News sources can be added by accessing the `source/add` route in the app. From there you can add the following details:

- title - the title that you want to give to the news source
- route - the route in which this specific news source can be accessed. Accessing the route should show the news items under that specific news source.
- category - each news source is organized by category. These categories will get listed on the sidebar. 
- curator - a machine-friendly name representing the curator or news source.
- base url - the URL in which to initially scrape from.
- day to update - the day in which to update this specific news source. Leave blank if you want to update daily.
- latest url element - the URL of the latest link that contains the links to the news items. If you check the [JavaScript Weekly archives](http://javascriptweekly.com/issues) you would see that the latest URL is in the upper left side. All you have to do is to add a CSS selector that would select that specific link. The app uses the [simple html dom library](simplehtmldom.sourceforge.net) for this purpose. 
- latest url index - the index of the latest url element. If its the first element then this should be `0`. If its the second then it should be `1` and so forth.
- latest url base - the base URL to be used for the latest URL. Most websites uses relative links so the value for the `href` would be something like `link/25.html`. We can't scrape from this kind of URL so you need to include a base such as `http://javascriptweekly.com/`. This URL is used as the prefix for the scraped value of the `href` attribute.  
- item element - a CSS selector to be used for selecting each news item. This is usually an `a` element. But be sure to include the containers (if any). Something like `#wrapper .container #links a` so that you can pinpoint the actual links that you want to select.
- short url - a boolean value used for determining whether to get the final URL for each news item. Set this to `true` if the news source uses short URL's for their news items. 
- on break - a boolean value for setting if the news source is currently on hiatus. This informs the app that the specific news source shouldn't be updated.
- xml - a boolean value for setting if the news source is in XML format. This is for news sources that uses RSS Feeds such as [echo JS](http://www.echojs.com/rss) and [sidebar.io](http://feeds.sidebar.io/SidebarFeed).
- h2 - specifically used for scraping Medium. Medium uses h2 and h3 tags for the title of each article. So this should contain the CSS selector for selecting those. 
- h3 - specifically used for scraping Medium. Medium uses h2 and h3 tags for the title of each article. So this should contain the CSS selector for selecting those.
- search string - the string to search in each news item URL.
- replace string - the string used for replacing the search string in each news item URL. This is true for news sources such as [slashdot](http://slashdot.org/) because the value for the `href` is something like `//slashdot.org/news-item-url`. So basically you need to replace `//slashdot.org` with `http://slashdot.org` in order to form a valid URL.
- api - a boolean value for specifying whether a news source is an API. This is true for Hacker News since they have an API. Note that support for API is only limited to the hacker news API at the moment. If you want to support other APIs, you can open a new issue or code it on your own and create a pull request.
- twitter - a boolean value for setting if the news source is a twitter user 
- unsorted - a boolean value for setting if the latest URL is unsorted. This means that initially the latest URL is an array. This is true for news sources such as [redis weekly](http://redisweekly.com/archive/). As you can see, the link for each issue is not ordered from the latest issue to the old issue. This means that we cannot use the latest url index to target the latest url. So what we do is to get all the links that are currently in the archives and sort them. This is what this field is for. Set it to `true` if you have a news source which has a similar structure to redis weekly.
- excluded text - a text value containing a list of text that should be excluded. Each text is separated by a new line
- excluded url - a text value containing the URL's to be excluded. Each URL is separated by a new line.
- twitter screen name - the twitter username of the news source
- parent element - the selector for the selecting the parent element of each news item. If for some reason you can't target each news item by simply specifying a value for the item element then use this.
- parent index - the index of the parent element.
- text source - not currently utilized in the code.
- has query - a boolean value for specifying if each news item URL has a query parameter in it containing the actual URL to the news item
- visit item link - a boolean value for specifying whether to visit each news item link in order to get the title of the page. Set this to `true` if you can't get the title directly through scraping the news item link. 
- api field - the name of the field which contains the actual news item links. This is true for [versioning](https://www.sitepoint.com/versioning/). Because they use an API to serve each individual issues but each issue contains links that can be scraped.
- item base url - the base URL to be used for each news item. This is true for github and producthunt since they use relative links for their news items.

###Sample Config Files

**.env**

```
APP_ENV=local
APP_DEBUG=true
APP_KEY=xxx53IxxxKvBlNtZi1xxxfKLQgxxxxaR

APP_TIMEZONE=Asia/Manila

APP_TITLE=UpdatedApp
APP_URL=http://updatedapp.dev

APP_LOCALE=en
APP_FALLBACK_LOCALE=en

DB_CONNECTION=mysql
DB_HOST=localhost
DB_PORT=3306
DB_DATABASE=dbname
DB_USERNAME=user
DB_PASSWORD=password

CACHE_DRIVER=array
SESSION_DRIVER=cookie
QUEUE_DRIVER=database
```

**config/github.php**

```
<?php
return [
    'password' => 'yourgithubpassword'
];
```

**config/twitter.php**

Create an app at [dev.twitter.com](https://dev.twitter.com/) to acquire a value for each.

```
<?php
return [
    'oauth_access_token' => "xxx",
    'oauth_access_token_secret' => "xxx",
    'consumer_key' => "xxx",
    'consumer_secret' => "xxx"
];
```

###Supported Sources

- Hacker News
- Next Draft
- Versioning
- HTML5Weekly
- JavaScript Weekly
- Ruby Weekly
- Database Weekly
- Postgres Weekly
- Status Code
- Node Weekly
- PHP Weekly
- Responsive Design Weekly
- NoSQL Weekly
- Python Weekly
- WebTools Weekly
- Web Development Reading List
- Web Design Weekly
- Mobile Web Weekly
- Hey Designer
- Gamedev.js Weekly
- Ember Weekly
- WPMail.me
- Beyond Desktop
- Pycoder's Weekly
- Perl Weekly
- Go-Lang Weekly
- iOS Dev Weekly
- Sidebar.io
- Android Weekly
- Medium
- Readability
- Slashdot
- Designer News
- Web Operations Weekly
- Longreads Tech
- JavaScript Live
- Cancel Bubble
- Reddit Programming
- Reddit Web Design
- Reddit Webdev
- Pocket Hits
- UX Design Weekly
- UX Weekly
- WebRTC Weekly
- Upvoted Science and Technology
- Upvoted News
- Docker Weekly
- Real-time Weekly
- MySQL News
- .Net Weekly
- Full Web Weekly
- Scala Times
- SASS News
- Makers Weekly
- User Onboard
- Stackshare
- Hacking UI
- Product Design Weekly
- This Week in Rust
- Clojure Gazette
- Green Ruby News
- Big Data Weekly
- Hadoop Weekly
- Machine Learning Newsletter
- AI Weekly
- Software Lead Weekly
- Redis Watch
- Data Science Weekly
- The Changelog
- Echo JS
- CSS Weekly
- Swift Weekly
- Web Audio Weekly
- Redis Weekly
- Github
- Product Hunt

##License

The MIT License (MIT) Copyright (c)

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
