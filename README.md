# skelton51

My Ruby on Rails 5.1 boilerplate.

Using Rails 5.2 version is [here](https://github.com/h-izumi/skelton52).

* Ruby 2.4
* Ruby on Rails 5.1
  * `rails new . -d postgresql --webpack=react --skip-coffee --skip-turbolinks -T`
* Sprockets 4
  * with [Ruby Babel Transpiler](https://github.com/babel/ruby-babel-transpiler)
* Webpacker
  * with React
* Haml
* dotenv
* Bootstrap 3 with **no jQuery**
  * with [bootstrap.native](https://thednp.github.io/bootstrap.native/)
* RSpec
* etc...

## How to use

Use [setup.rb](https://raw.githubusercontent.com/h-izumi/skelton51/master/setup.rb):

```shell
cd /path/to/app-parent
curl -L https://raw.githubusercontent.com/h-izumi/skelton51/master/setup.rb | APP_NAME="app-name" ruby
```

or Manually:

```shell
cd /path/to/app-parent
curl -L -o skelton51.zip https://github.com/h-izumi/skelton51/archive/master.zip
unzip skelton51.zip
mv skelton51-master app-name
rm skelton51.zip
cd app-name
find . -type f -print0 | xargs -0 sed -i -e 's/SKELTON51/APP_NAME/g'
find . -type f -print0 | xargs -0 sed -i -e 's/skelton51/app_name/g'
find . -type f -print0 | xargs -0 sed -i -e 's/Skelton51/AppName/g'
rm README.md
rm LICENSE.txt
rm setup.rb
git init
git add .
git commit -m "initial."
```

If use on macOS, you should set argument ` ''` after `sed -i`.

## License

[CC0 1.0](https://creativecommons.org/publicdomain/zero/1.0/deed).

You probably should remove `LICENSE.txt` file when use this repo on your work.
