MRuby::Gem::Specification.new('mruby-plato-i2c-enzi') do |spec|
  spec.license = 'MIT'
  spec.authors = 'Plato developers'
  spec.description = 'PlatoEnzi::I2C class'

  spec.add_dependency('mruby-plato-i2c')
  spec.add_test_dependency('mruby-string-ext')
end
