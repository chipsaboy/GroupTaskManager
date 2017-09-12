# GroupTaskManager

A Group Task Manager where you can create lists and assign tasks.

Clone this repository, then run:
```
$ bundle install
```

# Usage

Migrate the database:
```
$ rake db:migrate
```
Start the server by running:
```
$ rails s
```
Run the app in your web browser with:
```
$ open http://localhost:3000
```

## OAUTH

You will need to acquire your own keys for Facebook OmniAuth to work. Go to developers.facebook.com and set up a new app to get an app id and secret. After you get your keys, create a new file "application.yml"
```
/config/application.yml
```
In your application.yml file, insert your app id and key
```
FACEBOOK_APP_ID: "YOUR_APP_ID"
FACEBOOK_APP_SECRET: YOUR_APP_SECRET
```

# Contributors

This space is intended to be an opening and welcoming environment for collaboration in contribution, and as such all contributors are expected to maintain the principles of [Contributor Covenenant](http://contributor-covenant.org/). Please, report any bugs on GitHub at this project's [repository](https://github.com/chipsaboy/GroupTaskManager).

# License

This Web Application has been made available as an open source under the terms of the [MIT License](https://github.com/chipsaboy/GroupTaskManager/blob/master/LICENSE).
