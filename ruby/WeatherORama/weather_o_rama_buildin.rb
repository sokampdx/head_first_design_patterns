require 'observer'

class WeatherData
  include Observable

  attr_reader :temp, :humidity, :pressure

  def set_measurements(temp, humidity, pressure)
    @temp = temp
    @humidity = humidity
    @pressure = pressure
    changed
    notify_observers(temp, humidity, pressure)
  end
end

class Observer
  def initialize(weather_data)
    weather_data.add_observer(self)
  end
end

class CurrentConditionsDisplay < Observer
  def update(temp, humidity, pressure)
    @temp = temp
    @humidity = humidity
    display
  end

  def display
    puts "Current conitions: #{@temp.to_f}F degree and #{@humidity.to_f}% humidity"
  end
end

class StatisticsDisplay < Observer
  def initialize(weather_data)
    @num = 0
    @max_temp = 0.0
    @min_temp = 200.0
    @temp_sum = 0.0
    @weather_data = weather_data
    weather_data.add_observer(self)
  end

  def update(temp, humidity, pressure)
    @temp_sum += temp
    @num += 1

    @max_temp = temp if temp > @max_temp
    @min_temp = temp if temp < @min_temp

    display
  end

  def display
    puts "Avg/Max/Min temperature = #{@temp_sum / @num}/#{@max_temp.to_f}/#{@min_temp.to_f}"
  end
end

class ForecastDisplay < Observer
  def initialize(weather_data)
    @current_pressure = 29.92
    @weather_data = weather_data
    weather_data.add_observer(self)
  end

  def update(temp, humidity, pressure)
    @last_pressure = @current_pressure
    @current_pressure = pressure
    display
  end

  def display
    forecast =
      if @current_pressure > @last_pressure
        "Improving weather on the way!"
      elsif @current_pressure < @last_pressure
        "Watch out of cooler, rainy weather"
      else
        "More of the same"
      end
    puts "Forecast: #{forecast}"
  end
end

class HeatIndexDisplay < Observer
  def initialize(weather_data)
    @heat_index = 0.0
    @weather_data = weather_data
    weather_data.add_observer(self)
  end

  def compute_heat_index(t, rh)
    @heat_index = ((16.923 + (0.185212 * t) + (5.37941 * rh) - (0.100254 * t * rh) +
    (0.00941695 * (t * t)) + (0.00728898 * (rh * rh)) +
    (0.000345372 * (t * t * rh)) - (0.000814971 * (t * rh * rh)) +
    (0.0000102102 * (t * t * rh * rh)) - (0.000038646 * (t * t * t)) + (0.0000291583 *
    (rh * rh * rh)) + (0.00000142721 * (t * t * t * rh)) +
    (0.000000197483 * (t * rh * rh * rh)) - (0.0000000218429 * (t * t * t * rh * rh)) +
    0.000000000843296 * (t * t * rh * rh * rh)) -
    (0.0000000000481975 * (t * t * t * rh * rh * rh)))
  end

  def update(temp, humidity, pressure)
    compute_heat_index(temp, humidity)
    display
  end

  def display
    puts "Heat index is #{@heat_index}"
  end
end

def main
  weather_data = WeatherData.new
  CurrentConditionsDisplay.new(weather_data)
  StatisticsDisplay.new(weather_data)
  ForecastDisplay.new(weather_data)
  HeatIndexDisplay.new(weather_data)

  weather_data.set_measurements(80, 65, 30.4)
  weather_data.set_measurements(82, 70, 29.2)
  weather_data.set_measurements(78, 90, 29.2)
end

main if __FILE__ == $0
