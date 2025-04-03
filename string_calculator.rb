class StringCalculator
    def add(numbers)
        return 0 if numbers.empty?
        delimiter = /,|\n/
        if numbers.start_with?("//")
            parts = numbers.split("\n", 2)
            delimiter = Regexp.escape(parts[0][2])
            numbers = parts[1]
        end

        num_list = numbers.split(/#{delimiter}/).map(&:to_i)
        negatives = num_list.select { |n| n < 0 }
        raise "negative numbers not allowed #{negatives.join(',')}" unless negatives.empty?

        num_list.reject { |n| n > 1000 }.sum
    end
end