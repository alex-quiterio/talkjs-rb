# encoding: UTF-8
Gem::Specification.new do |spec|
  spec.platform = Gem::Platform::RUBY
  spec.name = 'talkjs'
  spec.version = '0.0.1'
  spec.licenses = ['MIT']
  spec.summary = 'Ruby wrapper for TalkJS API.'
  spec.description = 'Developed for easy integration with TalkJS'
  spec.required_ruby_version = '>= 2.0.0'

  spec.author = ['alex quiterio']
  spec.email = ['alexandre.quiterio@protonmail.com']
  spec.homepage = 'https://talkjs.com/docs/Reference/REST_API/index.html'

  spec.files         = Dir['{bin,lib}/**/*', 'README.md']
  spec.require_paths = ['lib']
  spec.requirements << 'none'

  spec.add_dependency 'httpclient', '~> 2.7.1'

  spec.add_development_dependency 'rspec', '~> 2.14.1'
  spec.add_development_dependency 'webmock', '~> 1.24'
end
