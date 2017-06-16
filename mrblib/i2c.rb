#
# PlatoEnzi::I2C class
#
module PlatoEnzi
  class I2C
    include Plato::I2C

    @@wire = nil

    def initialize(addr, wait=10)
      @@wire = ENZI::Wire.new(0, ENZI::Wire::DutyCycle_2) unless @@wire
      @addr = addr
      @wait = wait
    end

    def read(reg, len, type=:as_array)
      data = []
      @@wire.beginTransmission(@addr)
      @@wire.write(reg)
      delay(@wait)
      @@wire.endTransmission
      delay(@wait)
      @@wire.requestFrom(@addr, len)
      len.times {data << @@wire.read}
      data = data.inject('') {|s, c| s << c.chr} if type == :as_string
      data
    end

    def write(reg, data)
      case data
      when Fixnum
        da = [data]
      when Array
        da = data
      when String
        da = data.bytes
      else
        da = data.to_s.bytes
      end

      @@wire.beginTransmission(@addr)
      @@wire.write(reg)
      da.each {|v| @@wire.write(v)}
      delay(@wait)
      @@wire.endTransmission
    end
  end
end

# register enzi device
Plato::I2C.register_device(PlatoEnzi::I2C)
