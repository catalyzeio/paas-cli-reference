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
	system("cd ./paas/paas-onboarding-docs && gitbook serve ./")
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
