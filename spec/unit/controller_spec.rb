require "spec_helper"

describe Hana::Controller do
  describe "#initialize" do
    it "Takes exactly one argument" do
      expect{ Hana::Controller.new }.to raise_error ArgumentError
      expect{ Hana::Controller.new("hello", "world") }.to raise_error ArgumentError
    end

    it "Returns a new instance of Hana Controller" do
      expect(Hana::Controller.new("")).to be_an_instance_of Hana::Controller
    end
  end

  describe "#params" do
    it "Returns a hash" do
      allow(ENV).to receive(:params).and_return({})
      expect(Hana::Controller.new(ENV).params).to be_an_instance_of Hash
    end
  end

  describe "#response" do
    it "Returns a new instance of Rack Response" do
      expect(Hana::Controller.new(ENV).response("")).to be_an_instance_of Rack::Response
    end
  end

  describe "#get_response" do
    context "When response hasn't been initialized" do
      it "Returns nil" do
        expect(Hana::Controller.new(ENV).get_response).to be nil
      end
    end

    context "When response has been initialized" do
      it "Returns a new instance of Rack Response" do
        controller = Hana::Controller.new(ENV)
        controller.response("")
        expect(controller.get_response).to be_an_instance_of Rack::Response
      end
    end
  end

  describe "#redirect_to" do
    it "Returns a new instance of Rack Response" do
      expect(Hana::Controller.new(ENV).redirect_to("/")).to be_an_instance_of Rack::Response
    end
  end
end