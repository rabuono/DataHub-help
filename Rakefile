require 'html-proofer'

task :test do
  sh "bundle exec jekyll build"
  options = {
      alt_ignore:[/.*/], # don't worry about images without an alt tag
      url_ignore:[/http:\/\/localhost.*/] # ignore links to localhost, which are shown when walking through the installation
  }
  HTMLProofer.check_directory("./_site",options).run
end