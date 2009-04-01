module Puppet::Parser::Functions
	newfunction(:rand, :type => :rvalue ) do |args|
		rand( args[0] ).to_s
	end
end
