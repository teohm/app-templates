def source_paths
    [File.expand_path(File.dirname(__FILE__))]
end

append_file '.gitignore' do
  %w(
    bower_components
    public
  ).join("\n")
end

%w(
app/assets/javascripts
app/assets/stylesheets
public/404.html
public/422.html
public/500.html
public/favicon.ico
public/robots.txt
app/views/layouts/application.html.erb
).each do |file|
  remove_file file
end

#TODO change bower.json to ERB
%w(
.bowerrc
bower.json
package.json
app/assets/404.html
app/assets/422.html
app/assets/500.html
app/assets/favicon.ico
app/assets/robots.txt
app/assets/scripts/main.js
app/assets/styles/main.scss
app/views/layouts/application.html.erb
).each do |file|
  copy_file "files/#{file}", file
end

inject_into_class 'config/application.rb', 'Application' do
  <<-END

    # Disable stylesheet and javascript generators
    config.generators do |g|
      g.stylesheets false
      g.javascripts false
    end

    # Disable asset pipeline since we are not going
    # to use it for our static assets compilation
    config.assets.enabled = false

  END
end
