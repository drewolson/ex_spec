defmodule ExSpec do
  defmacro __using__(_) do
    quote do
      import ExSpec
      require ExUnit.Case

      Module.put_attribute(__MODULE__, :ex_spec_contexts, [])
    end
  end

  defmacro describe(message, body) do
    quote do
      previous_contexts = Module.get_attribute(__MODULE__, :ex_spec_contexts)
      context = %ExSpec.Context{name: unquote(message)}
      Module.put_attribute(__MODULE__, :ex_spec_contexts, [context|previous_contexts])

      unquote(body)

      Module.put_attribute(__MODULE__, :ex_spec_contexts, previous_contexts)
    end
  end

  defmacro context(message, body) do
    quote do
      describe(unquote(message), unquote(body))
    end
  end

  defmacro it(message, var \\ quote(do: _), body) do
    quote do
      contexts = Module.get_attribute(__MODULE__, :ex_spec_contexts) |> Enum.map(&(&1.name))
      full_message = [unquote(message)|contexts] |> Enum.reverse |> Enum.join(" ")

      ExUnit.Case.test(full_message, unquote(var), unquote(body))
    end
  end
end
