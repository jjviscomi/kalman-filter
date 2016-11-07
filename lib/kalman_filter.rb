# A Ruby implimentation of a Kalman Filter, linear quadratic estimator.
# Noisy sensor data, approximations in the equations that
# describe the system evolution, and external factors that are not accounted
# for all place limits on how well it is possible to determine the system's
# state. The Kalman filter deals effectively with the uncertainty due to
# noisy sensor data and to some extent also with random external factors.
# The Kalman filter produces an estimate of the state of the system as an
# average of the system's predicted state and of the new measurement using a
# weighted average. The purpose of the weights is that values with better
# (i.e., smaller) estimated uncertainty are "trusted" more. The weights
# are calculated from the covariance, a measure of the estimated uncertainty
# of the prediction of the system's state. The result of the weighted
# average is a new state estimate that lies between the predicted and
# measured state, and has a better estimated uncertainty than either alone.
# This process is repeated at every time step, with the new estimate and its
# covariance informing the prediction used in the following iteration. This
# means that the Kalman filter works recursively and requires only the last
# "best guess", rather than the entire history, of a system's state to
# calculate a new state.
#
# Author::    Joseph J. Viscomi  (mailto:jjviscomi@gmail.com)
# License::   MIT

class KalmanFilter
  attr_writer :process_noise, :measurement_noise, :state_vector,
              :control_vector, :measurement_vector

  # Returns the current value of the KalmanFilter.
  attr_reader :value

  # Returns the last value supplied to the KalmanFilter.
  attr_accessor :measurement

  # Creates a new KalmanFilter
  # Params:
  # +options+:: +Object+
  def initialize(options={})
    @covariance           = nil
    @value                = nil
    @measurement          = nil

    # setup defaults
    @process_noise        = (options[:process_noise]        ||  1.0)
    @measurement_noise    = (options[:measurement_noise]    ||  1.0)
    @state_vector         = (options[:state_vector]         ||  1.0)
    @control_vector       = (options[:control_vector]       ||  0.0)

    @measurement_vector   = (options[:measurement_vector]   ||  1.0)
  end

  # Updates the KalmanFilter with a new measurement.
  # Params:
  # +new_measurement+:: +Float+ the measurement to update the filter with
  # +control+:: +Number+ optional control variable that corresponds to control_vector
  # Returns: the updated value of the KalmanFilter
  def measurement=(new_measurement, control = 0.0)
    @measurement = new_measurement

    if value.nil?
      self.value       = new_measurement / measurement_vector
      self.covariance  = 1.0 / measurement_vector
    else

      # Prediction
      predicted_x =
        (state_vector * value) + (control_vector * control)
      predicted_covariance =
        ((state_vector * covariance) * state_vector) + process_noise

      # Gain
      kalman_gain = predicted_covariance * measurement_vector * (1 /
        ((measurement_vector * predicted_covariance *
          measurement_vector) + measurement_noise))

      # Correction
      covariance = predicted_covariance -
        (kalman_gain * measurement_vector * predicted_covariance)

      self.value = predicted_x + kalman_gain *
        (new_measurement - (measurement_vector * predicted_x))
    end

    value
  end

  private

    attr_writer   :value
    attr_reader   :process_noise, :measurement_noise, :state_vector,
                  :control_vector, :measurement_vector

    attr_accessor :covariance
end
