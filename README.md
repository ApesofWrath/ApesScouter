# Apes Scouter 

Apes Scouter is the system used by FRC Team 668, *The Apes of Wrath* for scouting at competition. It is used
as a local "offline" webserver running on a [Raspberry Pi](https://www.raspberrypi.org/), but could be used online as a web app as well.

Apes Scouter is written in Ruby using the [Sinatra](http://sinatrarb.com) framework and uses MySQL as the
backing datastore with [Sequel](http://sequel.jeremyevans.net/) as the ORM. Development and production are run on 
UNIX (Mac OS and Raspbian), but it should work on other Linux distributions as well. No promises that it will work on Windows.

Many parts of this project are based on the [Cheesy Parts](https://github.com/Team254/cheesy-parts) system created by FRC Team 254, *The Cheesy Poofs*.

## Development

Prerequisites:

* Ruby (2.6.1 is the current version we're using for development and production)
* [Bundler](http://gembundler.com)
* MySQL
* RVM (optional)

To run the server locally:

1. Create an empty MySQL database and a user account with full permissions on it.
1. Populate `config.json` with the parameters for the development and production environments. Set
`enable_wordpress_auth` to false and `members_url`, `base_address`, `gmail_user`, and `gmail_password` to blank; they are used for mechanisms specific to Team 254.
1. Run `bundle install`. This will download and install the gems that Cheesy Parts depends on.
1. Run `bundle exec rake db:migrate`. This will run the database migrations to create the necessary tables in
MySQL. **Please make sure your database has been created and that it is empty with no tables in it. Otherwise this command will fail**.
1. Run `ruby scouter_server.rb` to control the running of the server.

Due to the fact that this system is designed to be run locally, there is no authetication for the site. If you are planning on putting this out on the internet I highly recommend some sort of SSO mechanism.

## Deployment to a Raspberry Pi

Prerequisites (in addition to those above):

* hostapd
* dnsmasq
* Apache
* Passenger

1. Make the Raspberry Pi an access point. [Guide](https://www.raspberrypi.org/documentation/configuration/wireless/access-point.md).
1. Setup Apache for the webserver (Nginx should work as well). [Guide](https://www.digitalocean.com/community/tutorials/how-to-install-the-apache-web-server-on-debian-9)
1. Clone this repository (I recommend doing it in /var/www/html).
1. Setup Passenger. [Guide](https://www.phusionpassenger.com/docs/tutorials/what_is_passenger/)
1. Start Passenger.

## Contributing

If you have a suggestion for a new feature, create an issue on GitHub or shoot an e-mail to
[cking@apesofwrath668.org](mailto:cking@apesofwrath668.org). Or if you have some Ruby-fu and are feeling adventurous,
fork this project and send a pull request.

