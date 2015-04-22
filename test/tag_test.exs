defmodule TagTest do
  use ExSpec, async: true

  describe "tags" do
    context "are handled correctly" do
      @tag :dont_run_me
      it "excludes this test" do
        assert 1 == 2
      end
    end
  end
end
