require 'facter'

Facter.add("users") do
	setcode do
		%x{who|wc -l}.chomp
	end
end
