require "spec_helper"

describe Hana::Routing::Router do
  describe "#draw" do
    it "Doesn't take any arguments" do
      expect{ Hana::Routing::Router.new.draw(25) }.to raise_error ArgumentError
    end

    it "Expects a block and executes the content of the passed in block" do
      result = Hana::Routing::Router.new.draw do
        20 + 5
      end
      expect(result).to be 25
    end
  end

  describe "#root" do
    it "Takes exactly one argument" do
      expect{ Hana::Routing::Router.new.root("hello", "world") }.to raise_error ArgumentError
    end
  end
end
