defmodule Credo.Check.Consistency.TabsOrSpaces.Spaces do
  use Credo.Check.CodePattern

  def property_value, do: :spaces

  def property_value_for(%SourceFile{lines: lines, filename: filename}, _params) do
    Enum.map(lines, &property_value_for_line(&1, filename))
  end

  defp property_value_for_line({line_no, "  " <> _line}, filename) do
    PropertyValue.for(property_value(), filename: filename, line_no: line_no)
  end
  defp property_value_for_line({_, _}, _), do: nil
end
