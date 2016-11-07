[![Gem Version](https://badge.fury.io/rb/kalman_filter.svg)](https://badge.fury.io/rb/kalman_filter)

# kalman_filter
A ruby implementation of a Kalman filter that is easy to use.

 * what is it
   
   You can use a Kalman filter in any place where you have uncertain information about some dynamic system, and you can make an educated guess about what the system is going to do next. Even if messy reality comes along and interferes with the clean motion you guessed about, the Kalman filter will often do a very good job of figuring out what actually happened. And it can take advantage of correlations between crazy phenomena that you maybe wouldn’t have thought to exploit!

  Kalman filters are ideal for systems which are continuously changing. They have the advantage that they are light on memory (they don’t need to keep any history other than the previous state), and they are very fast, making them well suited for real time problems and embedded systems.

  ![Image of KalmanFilter](https://raw.githubusercontent.com/jjviscomi/kalman-filter/master/docs/kalflow.png)

### install
```bash
gem install kalman_filter
```
or include it in your Gemfile
```ruby
gem 'kalman_filter'
```
### options

```ruby
# process_noise: describes how much noise this system introduces.
# measurement_noise: describes how much noise is in the measurement itself.
# state_vector: describes how to transition from the current state to the next state.
# control_vector: describes how the filter changes given some other input.
  
kf = KalmanFilter.new process_noise: 0.005, measurement_noise: 0.5
```

### use

```ruby
require 'kalman_filter'

kf = KalmanFilter.new process_noise: 0.005, measurement_noise: 0.5

kf.measurement = 65     # records a new measurement into the filter, and returns the new value of the filter
# >> 65

kf.measurement = 72
# >> 72

kf.measurement          # returns the last measurement taken
# >> 72

kf.value                # returns the current value of the filter
# >> 69.67441860465117
```
