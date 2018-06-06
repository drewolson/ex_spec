defmodule ExSpec.Helpers do
  def full_message(module, message) do
    contexts = module |> Module.get_attribute(:ex_spec_contexts) |> Enum.map(& &1.name)

    [message | contexts] |> Enum.reverse() |> Enum.join(" ")
  end
end
