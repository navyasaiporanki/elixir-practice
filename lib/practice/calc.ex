defmodule Practice.Calc do

  def parse_float(text) do
    {num, _} = Float.parse(text)
    num
  end

  def calc(expr) do
    # This should handle +,-,*,/ with order of operations,
    # but doesn't need to handle parens.
       
   expr = expr |> String.split(~r/\s+/)
   r = div(expr)
   z =to_string(Enum.at(r,0))
   z = parse_float(z)
   z
   
  end
  
  def mul(expr) do
   index = Enum.find_index(expr, fn x -> x == "*" end)
   if index == nil do
     z = sum(expr)
     z
   else
     index_1 = Enum.at(expr, index - 1)
     index_2 = Enum.at(expr, index + 1)  
     index_1 = to_string(index_1)
     index_2 = to_string(index_2)
     {index_1,_} = Integer.parse(index_1)
     {index_2,_} = Integer.parse(index_2)
     c =  index_1 * index_2
     expr = List.delete_at(expr, index)
     expr = List.insert_at(expr, index, c)
     expr = List.delete_at(expr, index - 1)
     expr = List.delete_at(expr, index)
    IO.puts(expr)
     mul(expr)
   end
  end
  
  def div(expr) do
   index = Enum.find_index(expr, fn x-> x == "/" end)
   if index == nil do
    z = mul(expr)
    z
   else
    index_1 = Enum.at(expr, index - 1)
    index_2 = Enum.at(expr, index + 1)
    index_1 = to_string(index_1)
    index_2 = to_string(index_2)
    {index_1,_} = Integer.parse(index_1)
    {index_2,_} = Integer.parse(index_2)
    c =  div(index_1, index_2)
    expr = List.delete_at(expr, index)
    expr = List.insert_at(expr, index, c)
    expr = List.delete_at(expr, index - 1)
    expr = List.delete_at(expr, index)
    div(expr)
   end
  end
  
  def sum(expr) do
   index = Enum.find_index(expr, fn x -> x == "+" end)
   if index == nil do
    sub(expr)
   else
    index_1 = Enum.at(expr, index - 1)
    index_2 = Enum.at(expr, index + 1)
    index_1 = to_string(index_1)
    index_2 = to_string(index_2)
    {index_1,_} = Integer.parse(index_1)
    {index_2,_} = Integer.parse(index_2)
    c =  index_1 + index_2
    expr = List.delete_at(expr, index)
    expr = List.insert_at(expr, index, c)
    expr = List.delete_at(expr, index - 1)
    expr = List.delete_at(expr, index)
    sum(expr)
   end
  end

  def sub(expr) do
   index = Enum.find_index(expr, fn x-> x == "-" end)
   if index == nil do
    expr
   else
    index_1 = Enum.at(expr, index - 1)
    index_2 = Enum.at(expr, index + 1)
    index_1 = to_string(index_1)
    index_2 = to_string(index_2)
    {index_1,_} = Integer.parse(index_1)
    {index_2,_} = Integer.parse(index_2)
    c =  index_1 - index_2
    expr = List.delete_at(expr, index)
    expr = List.insert_at(expr, index, c)
    expr = List.delete_at(expr, index - 1)
    expr = List.delete_at(expr, index)
    sub(expr)
   end
  end


 end
