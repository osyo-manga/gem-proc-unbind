require "proc/unbind/version"

module Proc::Unbind
	refine ::Proc do
		def unbind method_name = :unbound_method
			self_ = self
			Module.new {
				define_method method_name, &self_
			}.instance_method(method_name)
		end

		def rebind obj
			unbind.bind obj
		end
	end
end
