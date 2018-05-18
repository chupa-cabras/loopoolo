# Loopoolo

Loopoolo is a system that allow you manage people. This systems uses some concepts of management 3.0 (created by Jurgen Appelo). The idea is "don't loose yourself" when you organize your feedbacks and some informations of your crew. 

### 1. Features

* Users management;  (on development)
* Roles management;  (on development)
* Encounters management (feedback);  (on development)
* Manage PDI (quests);  (on development)
* Competency Matrix ( https://management30.com/practice/competency-matrix/ );  (on development)
* Teams management;  (on development)
* Moving motivator ( https://management30.com/practice/moving-motivators/ )  (on development)
* Kudo box management ( https://management30.com/product/kudo-cards/ );  (on development)
* Manage useful links for default or for team;  (on development)
* Twitter, tumblr and instagram integratiom (just for fun :-D );  (on development)
* Gamification (manage conquests and so much more);  (on development)


### 2. Install

##### Create your own database file
cp config/database.yml.sample config/database.yml

##### Create your own secrets file
cp config/secrets.yml.sample config/secrets.yml

##### Setup database
bundle exec rake db:create
bundle exec rake db:migrate

##### Start web server
bundle exec rails server

### 3. I would like to contribute

Just access ( https://github.com/chupa-cabras/loopoolo/blob/master/CONTRIBUTING.md )

### 4. Credits
DW Pellegrina 
Jackson Borsatto

Thanks Admin LTE developers
https://adminlte.io/themes/AdminLTE/pages/tables/simple.html
https://adminlte.io/docs/2.4/installation