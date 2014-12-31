defmodule ExSpec do
  @moduledoc """
  ExSpec is a simple wrapper around ExUnit that adds Rspec-style macros. Specifically, it adds `describe`, `context` and `it`.

  While it takes inspiration from Rspec, ExSpec is significantly simplier. The `describe` and `context` macros have only two functions:

  1. Aid test organization
  2. Prepend to the message of any `it` defined within their do blocks

  Furthermore, `describe` and `context` are aliases and function identically.

  The `it` macro is identical to `ExUnit.Case.test` except that it is aware of the messages of its surrounding `describe` and `context` blocks.

  Other than the functionality described above, ExSpec is just ExUnit. When `use`ing `ExSpec`, any options provided will be passed to `ExUnit.Case` (e.g. `async: true`).

  A simple example is shown below. For more examples, see the tests.

  ## Example

      defmodule PersonTest do
        use ExSpec, async: true

        describe "#name" do
          context "with first and last name" do
            it "joins the names with a space" do
              drew = %Person{first_name: "Drew", last_name: "Olson"}

              assert Person.name(drew) == "Drew Olson"
            end
          end

          context "with only a first name" do
            it "returns the first name" do
              drew = %Person{first_name: "Drew", last_name: nil}

              assert Person.name(drew) == "Drew"
            end
          end
        end
      end
  """

  defmacro __using__(options) do
    quote do
      import ExSpec
      use ExUnit.Case, unquote(options)

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
