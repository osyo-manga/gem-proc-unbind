require "spec_helper"

using Proc::Unbind

RSpec.describe Proc::Unbind do
	shared_examples "OK" do
		it { expect(subject.call("homu").call).to eq "homu" }
		it { expect(subject.call(42).call).to eq 42 }
	end

	context "#unbind" do
		it { expect(proc { self }.unbind).to be_kind_of UnboundMethod }
		subject { -> obj { proc { self }.unbind.bind obj } }
		it_behaves_like "OK"
	end

	context "#rebind" do
		subject { -> obj { proc { self }.rebind obj } }
		it_behaves_like "OK"
	end
end
