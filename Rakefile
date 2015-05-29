desc "Update all submodules to development"
task :update_submodules_dev do
  system("git submodule foreach '[[ $name =~ ^paas/paas-onboarding-docs|^paas/paas-faq|^baas/baas-faq|^paas/paas-guides ]] \
    && branch=master \
    || branch=development; git pull origin $branch'")
end

desc "Update all submodules to master"
task :update_submodules_master do
  system("git submodule foreach git pull origin master")
end

desc "Build the website from source"
task :build do
  puts "## Building website"
  status = system("middleman build --clean")
  puts status ? "OK" : "FAILED"
end

desc "Run the preview server at http://localhost:4567"
task :preview do
  system("middleman server")
end

desc "Preview paas onboarding docs"
task :preview_paas_onboarding do
  system("cd ./paas/paas-onboarding-docs && middleman server")
end

desc "Preview baas guides"
task :preview_baas_guides do
  system("cd ./baas/baas-guides && middleman server")
end

desc "Preview baas examples"
task :preview_baas_examples do
  system("cd ./baas/baas-examples && middleman server")
end

desc "Deploy website via rsync"
task :deploy do
end

desc "Build and deploy website"
task :gen_deploy => [:build, :deploy] do
end

desc "Watch and compress Sass"
task :sass do
  system("cd source/assets/css && sass --watch styles.scss:styles.css --style compressed")
end
