require "proc/unbind"

using Proc::Unbind

class X
	attr_accessor :value
end


disp = proc {
	p self
	p @value
}
disp.call
#=> main
#=> nil

# Return UnboundMethod
disp.unbind


# Bind X object
x = X.new
x.value = 42
disp_ = disp.unbind.bind x

# Receiver is X object
disp_.call
#=> #<X:0x000000014313f8 @value=42>
#=> 42
