# mruby-plato-i2c-enzi   [![Build Status](https://travis-ci.org/mruby-plato/mruby-plato-i2c-enzi.svg?branch=master)](https://travis-ci.org/mruby-plato/mruby-plato-i2c)
Plato::I2C class (I2C bus interface) for enzi board
## install by mrbgems
- add conf.gem line to `build_config.rb`

```ruby
MRuby::Build.new do |conf|

  # ... (snip) ...

  conf.gem :git => 'https://github.com/mruby-plato/mruby-plato-i2c'
  conf.gem :git => 'https://github.com/mruby-plato/mruby-plato-i2c-enzi'
end
```

## example
```ruby
i2c = Plato::I2C.open(0x40)
puts i2c.read(0, 2) # -> [100, 2]
```

## License
under the MIT License:
- see LICENSE file
