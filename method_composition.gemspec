Gem::Specification.new do |s|
  s.require_paths = ["lib"]
  s.name        = 'method_composition'
  s.version     = '0.0.1'
  s.licenses    = ['MIT']
  s.summary     = "build classes based on function(method) composition"
  s.description = "Do you know function composition e.g. from elixir? \
                   Now you can easily build classes based on this future! \
                   Just include MethodComposition module and define methods fire order using methods_chain method."
  s.authors     = ["mdziardziel"]
  s.files       = ["lib/method_composition.rb"]
  s.homepage    = 'https://rubygems.org/gems/method_composition'
  s.metadata    = { "source_code_uri" => "https://github.com/mdziardziel/method_composition" }
end
