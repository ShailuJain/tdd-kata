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

    it "supports custom delimiter" do
        calculator = StringCalculator.new
        expect(calculator.add("//;\n1;2")).to eq(3)
    end

    it "raises an exception for negative numbers" do
        calculator = StringCalculator.new
        expect { calculator.add("1,-2,3,-4") }.to raise_error("negative numbers not allowed -2,-4")
    end

    it "ignores numbers greater than 1000" do
        calculator = StringCalculator.new
        expect(calculator.add("2,1001")).to eq(2)
    end

    it "supports delimiters of any length" do
        calculator = StringCalculator.new
        expect(calculator.add("//[***]\n1***2***3")).to eq(6)
    end

    it "supports multiple delimiters" do
        calculator = StringCalculator.new
        expect(calculator.add("//[*][%]\n1*2%3")).to eq(6)
    end      
  end
end
