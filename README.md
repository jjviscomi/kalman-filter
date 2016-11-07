# kalman-filter
A ruby implementation of a Kalman filter

### options

```ruby
# process_noise: describes how much noise this system introduces.
# measurement_noise: describes how much noise is in the measurement itself.
# state_vector: describes how to transition from the current state to the next state.
# control_vector: describes how the filter changes given some other input.
  
kf = KalmanFilter.new process_noise: 0.005, measurement_noise: 0.5
```
