def source_paths
    [File.expand_path(File.dirname(__FILE__))]
end

append_file '.gitignore' do
  %w(
    bower_components
    public
  ).join("\n")
end

remove_file 'app/assets/javascripts'
remove_file 'app/assets/stylesheets'
remove_file 'public/404.html'
remove_file 'public/422.html'
remove_file 'public/500.html'
remove_file 'public/favicon.ico'
remove_file 'public/robots.txt'
remove_file 'app/views/layouts/application.html.erb'


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
    # Disable asset pipeline since we are not going
    # to use it for our static assets compilation
    config.assets.enabled = false

  END
end
