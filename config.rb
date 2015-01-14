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
set :markdown, :fenced_code_blocks => true, :smartypants => true, :tables => true, :with_toc_data => true, :no_intra_emphasis => true

activate :syntax, :wrap => true

# Set layouts for groups of pages
page "/paas/getting-started/*", :layout => "paas_gettingstarted"
page "/baas/guides/*", :layout => "baas_single"
page "/baas/api-reference/*", :layout => "baas_guides"

helpers do
  def site_title
    "Catalyze Resources"
  end

  def nav_link(name, url, options={})
    options = {
      class: "",
      active_if: url,
    }.update options
    active_url = options.delete(:active_if)
    active = Regexp === active_url ? current_page.url =~ active_url : current_page.url == active_url
    options[:class] += "r_is-active" if active
    link_to name, url, options
  end
end