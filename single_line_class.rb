#Prefer a single-line format for class definitions with no body
class FooError < StandardError
end

class Test
	# Avoid single-line methods.
    def too_much; puts 'pravin'; puts 'mishra' end 
    
    # bad
    e = M * c ** 2
    [ 1, 2, 3 ].size

    # bad
	case
  		when song.name == 'Misty'
    		puts 'Not again!'
  		when song.duration > 120
    		puts 'Too long!'
  		when Time.now.hour > 21
    		puts "It's too late"
  		else
    		song.play
	end

	# bad
    some_method(size, count, color, )
end