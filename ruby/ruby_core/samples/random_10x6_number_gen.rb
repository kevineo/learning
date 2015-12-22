def generate_number(row_before, column, column_index, number)
	# Filter first row
	if row_before.nil?
		return rand(10) if column.empty?

		accepted = false
		until accepted
			number = rand(10)
			return number unless column.include?(number)
		end
	end

	# Check previous row
	until accepted
		number = rand(10)
		next if row_before[column_index - 1] == number or row_before[column_index] == number or row_before[column_index + 1] == number
		next if column[-1] == number
		unless column.empty?
			next if column.include? number
		end
		return number
	end


	nil
end


def generate_table(row, column)
	# Create Table
		table = []

	# Loop over n times
	row.times do |row_index|
		column_array = []
		# Generate row
		column.times do |column_index|
			number = nil
			while number.nil?
				number = generate_number(table[row_index - 1], column_array, column_index, number)
			end
			column_array << number
		end
		# Push to Table
		table << column_array
	end
	# Return Table
	table
end


def print_table(table)
	table.each do |row|
		p row
	end
end

print_table generate_table(10, 6)
