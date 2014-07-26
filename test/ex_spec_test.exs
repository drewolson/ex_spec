defmodule ExSpecTest do
  use ExUnit.Case, async: true
  use ExSpec

  test "standard tests work" do
    assert 1 + 1 == 2
  end

  it "handles top level tests" do
    assert 1 + 1 == 2
  end

  describe "describes" do
    describe "can be nested" do
      it "arbitrarily" do
        name = __ENV__.function |> elem(0)

        assert name == :"test describes can be nested arbitrarily"
      end
    end
  end

  describe "contexts" do
    context "can be nested" do
      it "as well" do
        name = __ENV__.function |> elem(0)

        assert name == :"test contexts can be nested as well"
      end
    end
  end
end