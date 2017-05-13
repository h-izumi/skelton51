class String
  def camelize
    split(/[^[:alnum:]]+/).map(&:capitalize).join
  end

  def underscore
    self.gsub(/::/, '/').
    gsub(/([A-Z]+)([A-Z][a-z])/,'\1_\2').
    gsub(/([a-z\d])([A-Z])/,'\1_\2').
    tr("-", "_").
    downcase
  end
end

app_name = ENV['APP_NAME']

if app_name.nil? || app_name.size < 0
  puts "Please set APP_NAME='your-app-name'"
  exit
end

app_parent_dir = Dir.pwd

Dir.chdir("/tmp")
`curl -L -o skelton51.zip https://github.com/h-izumi/skelton51/archive/master.zip`
`unzip skelton51.zip`
`mv skelton51-master #{app_parent_dir}/#{app_name}`
`rm skelton51.zip`

Dir.chdir("#{app_parent_dir}/#{app_name}")
`find . -type f -print0 | xargs -0 sed -i -e 's/SKELTON51/#{app_name.upcase.tr("-", "_")}/g'`
`find . -type f -print0 | xargs -0 sed -i -e 's/skelton51/#{app_name.underscore}/g'`
`find . -type f -print0 | xargs -0 sed -i -e 's/Skelton51/#{app_name.camelize}/g'`
`rm README.md`
`rm UNLICENSE`
`rm setup.rb`
`git init`
`git add .`
`git commit -m "initial."`

