# PlatoEnzi::I2C class

module ENZI
  class Wire
    DutyCycle_2 = 0
    def initialize(ch, duty); end
    def beginTransmission(addr); end
    def endTransmission; end
    def write(reg); 0; end
    def requestFrom(addr, len); end
    def read; 0; end
  end
end
def delay(ms); end

assert('I2C', 'class') do
  assert_equal(PlatoEnzi::I2C.class, Class)
end

assert('I2C', 'superclass') do
  assert_equal(PlatoEnzi::I2C.superclass, Object)
end

assert('I2C', 'new') do
  i1 = PlatoEnzi::I2C.new(0)
  i2 = PlatoEnzi::I2C.new(0, 0)
  assert_true(i1 && i2)
end

assert('I2C', 'new - argument error') do
  assert_raise(ArgumentError) {PlatoEnzi::I2C.new}
  assert_raise(ArgumentError) {PlatoEnzi::I2C.new(0, 1, 2)}
end

assert('I2C', 'oepn - Plato::I2C') do
  Plato::I2C.register_device(PlatoEnzi::I2C)
  Plato::I2C.open(0)
end

assert('I2C', 'read') do
  i2c = PlatoEnzi::I2C.new(0)
  assert_equal(i2c.read(0, 1), [0])
  assert_equal(i2c.read(0, 4, :as_array), [0, 0, 0, 0])
  assert_equal(i2c.read(0, 3, :as_string), "\0\0\0")
end

assert('I2C', 'read - argument error') do
  i2c = PlatoEnzi::I2C.new(0)
  assert_raise(ArgumentError) {i2c.read}
  assert_raise(ArgumentError) {i2c.read(1)}
  assert_raise(ArgumentError) {i2c.read(1, 2, :as_string, 4)}
end

assert('I2C', 'write') do
  assert_nothing_raised {
    i2c = PlatoEnzi::I2C.new(0)
    i2c.write(0, 0)
    i2c.write(0, [0, 1, 2, 3])
    i2c.write(0, 'abc')
    i2c.write(0, :off)
  }
end

assert('I2C', 'write - argument error') do
  i2c = PlatoEnzi::I2C.new(0)
  assert_raise(ArgumentError) {i2c.write}
  assert_raise(ArgumentError) {i2c.write(0)}
  assert_raise(ArgumentError) {i2c.write(0, 1, 2)}
end
