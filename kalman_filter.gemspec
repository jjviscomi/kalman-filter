Gem::Specification.new do |s|
  s.name        = 'kalman_filter'
  s.version     = '1.0.1'
  s.date        = '2016-11-07'
  s.summary     = "A Ruby implimentation of a Kalman Filter,
    linear quadratic estimator."
  s.description = "Noisy sensor data, approximations in the equations that
    describe the system evolution, and external factors that are not accounted
    for all place limits on how well it is possible to determine the system's
    state. The Kalman filter deals effectively with the uncertainty due to
    noisy sensor data and to some extent also with random external factors.
    The Kalman filter produces an estimate of the state of the system as an
    average of the system's predicted state and of the new measurement using a
    weighted average. The purpose of the weights is that values with better
    (i.e., smaller) estimated uncertainty are \"trusted\" more. The weights
    are calculated from the covariance, a measure of the estimated uncertainty
    of the prediction of the system's state. The result of the weighted
    average is a new state estimate that lies between the predicted and
    measured state, and has a better estimated uncertainty than either alone.
    This process is repeated at every time step, with the new estimate and its
    covariance informing the prediction used in the following iteration. This
    means that the Kalman filter works recursively and requires only the last
    \"best guess\", rather than the entire history, of a system's state to
    calculate a new state."
  s.authors     = ["Joseph Viscomi"]
  s.email       = 'jjviscomi@gmail.com'
  s.files       = ["lib/kalman_filter.rb"]
  s.required_ruby_version = '>= 1.9.3'
  s.require_paths = ['lib']
  s.homepage    =
    'https://github.com/jjviscomi/kalman-filter'
  s.license       = 'MIT'
end
