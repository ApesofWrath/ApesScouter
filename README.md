# Apes Scouter 

Apes Scouter is the system used by FRC Team 668, [*The Apes of Wrath*](http://apesofwrath668.org/) for scouting at competition. 

Apes Scouter is written in Ruby using the [Sinatra](http://sinatrarb.com) framework and uses MySQL as the
backing datastore with [Sequel](http://sequel.jeremyevans.net/) as the ORM. Development and production are run on 
UNIX (Mac OS and Ubuntu), but it should work on other Linux distributions as well. No promises that it will work on Windows.

Many parts of this project are based on the [Cheesy Parts](https://github.com/Team254/cheesy-parts) system created by FRC Team 254, *The Cheesy Poofs*.

## Development

Prerequisites:

* Ruby (2.6.1 is the current version we're using for development and production)
* [Bundler](http://gembundler.com)
* MySQL
* RVM (optional)

To run the server locally:

1. Create an empty MySQL database and a user account with full permissions on it.
1. Edit the `db.rb` file with the parameters for your environment.
1. Set the database password as an environment variable (so that it stays out of version control).
1. Run `bundle install`. This will download and install the gems that Apes Scouter depends on.
1. Run `bundle exec rake db:migrate`. This will run the database migrations to create the necessary tables in
MySQL. **Please make sure your database has been created and that it is empty with no tables in it. Otherwise this command will fail**.
1. Run `rackup config.ru` and you should be able to run the app in the browser at `http://localhost:XXXX`, where `XXXX` is the four-digit port specified after running the `rackup` command.

Due to the fact that this system was designed to be run locally, there is no authetication for the site. If you are planning on putting this out on the internet I highly recommend some sort of SSO mechanism.

## Deployment to a Production Server

Prerequisites (in addition to those above):

* hostapd
* dnsmasq
* Apache
* Passenger

1. Setup Apache as the webserver (Nginx should work as well). [Guide](https://www.digitalocean.com/community/tutorials/how-to-install-the-apache-web-server-on-debian-9)
1. Clone this repository (take note of the directory).
1. Follow the steps above, except for step 6. (**Note: in addition to setting a system environment variable, you may need to set the environment variable in your Apache virtual host file using `SetEnv` -> `SetEnv DB_PASS your_password`**)
1. Setup Passenger. [Guide](https://www.phusionpassenger.com/docs/tutorials/what_is_passenger/)
1. Start Passenger.

## Contributing

If you have a suggestion for a new feature, create an issue on GitHub or shoot an e-mail to
[cking@apesofwrath668.org](mailto:cking@apesofwrath668.org). Or if you have some Ruby-fu and are feeling adventurous,
fork this project and send a pull request.

