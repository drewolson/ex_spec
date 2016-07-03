defmodule ExSpecTest do
  use ExSpec, async: true

  test "standard tests work" do
    assert 1 + 1 == 2
  end

  it "handles top level tests" do
    assert 1 + 1 == 2
  end

  describe "describes" do
    context "and contexts" do
      context "can be nested" do
        it "arbitrarily" do
          name = __ENV__.function |> elem(0)

          assert name == :"test describes and contexts can be nested arbitrarily"
        end
      end
    end
  end

  @tag :skip
  it "supports pending tests"
end
