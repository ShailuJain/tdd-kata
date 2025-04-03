require_relative '../string_calculator'

RSpec.describe StringCalculator do
  describe "#add" do
    it "returns 0 for an empty string" do
        calculator = StringCalculator.new
        expect(calculator.add("")).to eq(0)
    end

    it "returns the number itself for a single number string" do
        calculator = StringCalculator.new
        expect(calculator.add("1")).to eq(1)
    end

    it "returns the sum of two numbers" do
        calculator = StringCalculator.new
        expect(calculator.add("1,2")).to eq(3)
    end

    it "returns the sum of multiple numbers" do
        calculator = StringCalculator.new
        expect(calculator.add("5,1,3,4")).to eq(13)
    end
    
    it "handles new lines between numbers" do
        calculator = StringCalculator.new
        expect(calculator.add("1\n2,3")).to eq(6)
    end
  end
end
