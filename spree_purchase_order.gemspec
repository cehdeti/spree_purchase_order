# encoding: UTF-8
Gem::Specification.new do |s|
  s.platform    = Gem::Platform::RUBY
  s.name        = 'spree_purchase_order'
  s.version     = '1.1.1'
  s.summary     = 'Add purchase order checkout ability'
  s.description = 'Spree Purchase Order adds the ability to checkout using a purchase order on spree ecommerce'
  s.required_ruby_version = '>= 1.8.7'

   s.author    = 'Joe Wegner'
   s.email     = 'joe@cultivatestudios.com'
   s.homepage  = 'http://www.cultivatestudios.com'

  s.files       = `git ls-files`.split("\n")
  s.test_files  = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.require_path = 'lib'
  s.requirements << 'none'

  spree_version = '>= 3.1.0', '< 4.0'
  s.add_dependency 'spree', spree_version

  s.add_development_dependency 'capybara', '~> 2.6'
  s.add_development_dependency 'coffee-rails'
  s.add_development_dependency 'database_cleaner'
  s.add_development_dependency 'factory_girl', '~> 4.5'
  s.add_development_dependency 'ffaker'
  s.add_development_dependency 'rspec-rails', '~> 3.4'
  s.add_development_dependency 'sass-rails', '~> 5.0.0'

end
