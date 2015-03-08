defmodule SetupTest do
  use ExSpec, async: true

  setup do
    {:ok, [foo: "bar"]}
  end

  describe "setups" do
    context "are handled" do
      it "correctly", context do
        assert context[:foo] == "bar"
        assert context[:baz] == nil
      end
    end
  end

  describe "setups within blocks" do
    setup do
      {:ok, [baz: "qux"]}
    end
  
    it "runs setup only in this block", context do
      assert context[:foo] == "bar"
      assert context[:baz] == "qux"
    end
  end
end
