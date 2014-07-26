defmodule TagTest do
  use ExUnit.Case, async: true
  use ExSpec

  describe "tags" do
    context "are handled correctly" do
      @tag :foo
      it "excludes this test" do
        assert 1 == 2
      end
    end
  end
end
