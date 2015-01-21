## Catalyze Resources

Catalyze Resources serve to aid users in finding documentation, guides, references, and libraries for all [Catalyze Products](https://catalyze.io/products). Beyond technical documentation, Catalyze Resources also provides a landing page to find compliance documentation.

Catalyze Resources is comprised of two layers. The first layer is the one you are on right now, the "main" resources repo layer, with the second layer being the content layer. These content layers typically live in their own repos, with the exception being the PaaS CLI reference and the BaaS API reference as these are generated automatically (these may move to their own repos in the future). **Please note that content layer repos are referenced in the main resources repo as submodules**. A content layer repo should only ever have markdown files. The following content layer repos are used in Catalyze Resources:

- [PaaS Onboarding Docs](https://github.com/catalyzeio/paas-onboarding-docs)
- [BaaS Examples](https://github.com/catalyzeio/baas-examples)
- [BaaS Guides](https://github.com/catalyzeio/baas-guides)

Adding content to these repos is a matter of cloning them, checking out the development branch, making your changes locally to the markdown files and committing and pushing your changes back to development. If your changes require a review please follow the Catalyze pull request guidelines. (only grammar changes can bypass a PR)

**Please note that cloning this repo and having it locally on your machine is not required in order to make changes to content layers, in fact the only use cases for having this repo locally are, one: view the site locally, and two: make development code changes**

It's important to remember that you never want to make content changes within the main resources repo (the one you are viewing now) because it's required that you commit and push your changes via the content layer repo.

Recap: The Catalyze Resources repo is simply an aggregator of all content contained within submodules, which are referred to as content layers. To make content changes you change markdown files within the content layer repos.


### Local Setup

**Dependencies**

- Ruby and Rubygems. These come preinstalled on OS X (If you are working with multiple versions of ruby RVM is highly recommended)
- Bundler `gem install bundler`
- Middleman `gem install middleman`

**Installation**

- Clone this repo `git clone https://github.com/catalyzeio/catalyze-resources.git`
- Check out the development branch `cd catalyze-resources && git checkout origin development`
- Install gems `bundle install` (just `bundle` with rvm)
- Initialize gitmodules `git submodule init`
- Update submodules `git submodule update`

**Running**

Once everything is installed you'll be able to run the site locally by entering `rake preview` which executes the middleman server. Your local version of the site will be running at `http://0.0.0.0:4567`

### Updating Submodules

Updating submodules is a matter of running the appropriate rake task. To update each submodule with their respective development branches run `rake update_submodules_dev`. For a submodule master branch update run `update_submodules_master`.

### References