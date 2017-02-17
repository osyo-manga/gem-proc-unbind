require "proc/unbind"

using Proc::Unbind

expr = proc { |*args, &block|
	p self
	p args
	p block
}

#######################################
# #instance_exec

# Can not pass block arguments
42.instance_exec(1, 2, 3, &expr)
# => 42
# => [1, 2, 3]
# => nil


#######################################
# Proc#unbind

# Can pass block arguments
expr.unbind.bind(self).call(1, 2, 3, &proc {})
# => 42
# => [1, 2, 3]
# => #<Proc:0x00000001b4a298@/gem/proc-unbind/example/compare_instance_exec.rb:25>

