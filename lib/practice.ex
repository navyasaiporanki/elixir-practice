defmodule Practice do
  @moduledoc """
  Practice keeps the contexts that define your domain
  and business logic.

  Contexts are also responsible for managing your data, regardless
  if it comes from the database, an external API or others.
  """

  def double(x) do
    2 * x
  end

  def calc(expr) do
    # This is more complex, delegate to lib/practice/calc.ex
    Practice.Calc.calc(expr)
  end

  def factor(x) do
    # Maybe delegate this too.
  
     
      x = to_string(x)
      {z,_} = Integer.parse(x)
      list = []
      y = primefactor(z,2,list)
     
      addstring(y,0,length(y))
     
     
  end 

def addstring(inputArray,index,size) do
   if (index == size) do
       ans = " "
       #ans = String.trim(ans)
       ans       
   else
       final = Integer.to_string(Enum.at(inputArray,index))  <> " " <> addstring(inputArray,index + 1,size) 
       final
   end
end
 
  def primefactor(n, i , list )   do
  
 
    if n  <  i do
      list
    else	
      if (rem(n,i) == 0)  do
        le = list ++ [i]
        primefactor(div(n,i), i, le)
      else
        primefactor(n,i+1, list)
      end
   end
 end     
  
  

  def palindrome(x) do
  
   y = String.reverse(x)

   if y === x do 
     "yes"
   else
     "no"
end
  end
  # TODO: Add a palindrome? function.
end
