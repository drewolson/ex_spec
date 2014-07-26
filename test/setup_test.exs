defmodule SetupTest do
  use ExUnit.Case, async: true
  use ExSpec

  setup do
    {:ok, [foo: "bar"]}
  end

  describe "setups" do
    context "are handled" do
      it "correctly", context do
        assert context[:foo] == "bar"
      end
    end
  end
end
