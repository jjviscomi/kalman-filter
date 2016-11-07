require 'kalman_filter'

RSpec.describe KalmanFilter, "#value" do
  kf = KalmanFilter.new
  context "with a default filter" do

    it "#measurement = 65" do
      kf.measurement = 65
      expect(kf.measurement).to eq 65
    end

    it "checking #value is equal to #measurement" do
      expect(kf.value).to eq kf.measurement
    end

    it "#measurement = 72" do
      kf.measurement = 72
      expect(kf.measurement).to eq 72
    end

    it "checking #value for second #measurement" do
      expect(kf.value).to eq 69.66666666666667
    end
  end
end
