class KalmanFilter
  attr_writer :process_noise, :measurement_noise, :state_vector,
              :control_vector, :measurement_vector

  attr_reader :value

  attr_accessor :measurement

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
