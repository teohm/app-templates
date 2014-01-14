# app-templates

Various application templates, including Rails, Grunt etc.

## Install

```
git clone https://github.com/teohm/app-templates.git ~/.app-templates
```

OR

```
# TODO: create tiny url

# Options 1: wget
bash < <(wget -qO - https://raw.github.com/teohm/app-templates/master/install.sh)

# Options 2: curl
bash < <(curl -s https://raw.github.com/teohm/app-templates/master/install.sh)
```

## Use

```
# For new Rails app
rails new {app_name} -m ~/.app-templates/rails-grunt/setup.rb

# For existing Rails app
rake rails:template LOCATION=~/.app-templates/rails-grunt/setup.rb
```
