Time.zone = "UTC"

set :css_dir, 'assets/css'
set :js_dir, 'assets/js'
set :images_dir, 'assets/img'

activate :directory_indexes

configure :build do
  activate :minify_css
  activate :minify_javascript
  activate :asset_hash
  activate :directory_indexes
end

set :markdown_engine, :redcarpet
set :markdown, :fenced_code_blocks => true, :smartypants => true

activate :syntax

#Activate PaaS CLI with Blog Extension (Killing for now)
# activate :blog do |blog|
#   blog.name = "paas_cli"
#   blog.prefix = "/paas/cli/sections"
# end

# page "/feed.xml", layout: false

helpers do
  def site_title
    "Catalyze Resources"
  end
end