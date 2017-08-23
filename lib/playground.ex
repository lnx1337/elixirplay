# https://elixir-examples.github.io/
# http://www.newthinktank.com/2017/04/learn-elixir-one-video/
# https://elixir-examples.github.io/
# https://elixir-examples.github.io/single-page
# https://github.com/lexmag/elixir-style-guide#no-need-for-comments

# Elixir basics
defmodule Playground do
  
    def hello do
      a = "hello"
    end
  
    def concat do
      IO.puts "hello" <> "hello"
    end
  
    def varseq do
      a = 1
      IO.puts a
    end
  
    def force_use_exist_val do
      a = 1337 
      [ ^a, b] = [ 1337, 2 ]
  
      IO.puts a
      IO.puts b
    end
  
    def log(x) do
      IO.puts x
    end
  
    def enum_example do
      l = [ "a", "b", "c" ]
      Enum.each( l,  fn(x) -> log(x) end)
    end
  
    def enum_map do
      m = [a: 1, b: 2, c: 3]
      log(m)
    end
  
    def annon_func(n1, n2) do
      suma = fn(x, y) -> x+y; end
      suma.(n1, n2)
    end
   
    # LISTS
    def list_example do
      list = [ 1, 2, 3, 4 ]
      IO.puts list
    end
  
    def list_to_vars do
      [ a, b ] = [ 1, 2 ]
      IO.puts a 
      IO.puts b
    end
  
    def list_ignore_elements do
      [ a, _ ] = [ 1, 2]
      IO.puts a
    end
  
    def list_concat_right do
      list = [{:a, 1}, {:b, 2}]
      _ = list ++ [c: 3]
    end
  
    def list_concat_left do
      list = [{:a, 1}, {:b, 2}]
      _ = [c: 3] ++ list
    end
  
    def list_subs do
      list = ["foo", :bar, 42] -- [42, "bar"]
      list_two = [1,2,2,3,2,3] -- [1,2,3,2]
      
      IO.inspect list
      IO.inspect list_two
    end
  
    def list_head_tail do
      hd [3.14, :pie, "Apple"]
      |> IO.inspect 
  
      [head | tail] = [3.14, :pie, "Apple"]
      IO.inspect head
      IO.inspect tail
    end
    
    #Tuples
    def tuples do
      IO.inspect {3.14, :pie, "Apple"}
    end
  
    #Maps
    def maps do
      m = %{:name => "jair", :lastName => "pena" }
      # acces map data
      log m[:name]
      log m[:lastName]
      log m.name
      log m.lastName
  
      #get
      log Map.get m, :name
  
      #put
      m = Map.put(m, :age, 26)
  
      Map.to_list(m) # TODO: how to each
  
      #updateKeyValue 
      m = %{m | :age => 27}
      
      Enum.map(m, fn({k, v}) -> log(k); log(v); end)
  
    end
  
    #
    # Structs Examples
    #
    def struct_get_user do
      users = [
        john: %{name: "John", age: 27, languages: ["Erlang", "Ruby", "Elixir"]},
        mary: %{name: "Mary", age: 29, languages: ["Elixir", "F#", "Clojure"]}
      ]
      IO.inspect users
    end
  
    def struct_get_element do
      users = struct_get_user()
      log(users[:john].age)
    end
  
    def struct_update_element do
      users = struct_get_user()
      users = put_in users[:john].age, 31
      IO.inspect users
    end
  
    def struct_push_element do
      users = struct_get_user()
      {_, map} = List.keyfind(users, :mary, 0)
      map = %{map | languages: map.languages ++ ["Golang"]}
      users = List.keyreplace(users, :mary, 0, {:mary, map})
      IO.inspect users
    end
  
    def struct_delete_item do
      users = struct_get_user()
      users = update_in users[:mary].languages, fn lang -> List.delete(lang, "Clojure") end
      IO.inspect users
    end
  
    def struct_push_list do
      users = struct_get_user()
      newElement =[
        jair: %{name: "Mary", age: 29, languages: ["Elixir", "F#", "Clojure"]}
      ]
      users  = users ++ newElement
      IO.inspect users
    end
  
  
    #enums
    def enum_reduce do
      Enum.reduce [1, 2, 3, 4, 5], fn(num, acc) ->
        num + acc
      end
    end
  
    def enum_reduce_map do
      map = %{ a: 1, b: 2, c: 3 }
      Enum.reduce(map, 0, fn({_k, v}, acc) -> v + acc end)
    end
  
    #filter
  
    def enum_filter_list do
      [3, 4] = Enum.filter( [1, 2, 3, 4], fn(x) -> x > 2 end )
    end
  
    #PipeOperator
    def pip_operator do
      ["A", "B", "C"] = "a,b,c"
              |> String.split(",")
              |> Enum.map( &String.upcase/1 )
      
      #same
      IO.puts Enum.map(String.split("a,b,c", ","), &String.upcase/1)
    end
  
  
    # refernece videos
    #https://www.youtube.com/watch?v=YU2i3L-euB0&t=4335s  programacion funional
    #https://www.youtube.com/watch?v=d9kKqrKjveY
    #https://www.youtube.com/watch?v=CJT8wPnmjTM&t=469s
    #https://www.youtube.com/watch?v=HSyaF9KOzdk
    #https://www.youtube.com/watch?v=s-E_V5Xyg6k
    #https://www.youtube.com/watch?v=rX6tC5K_XaI
    #https://www.youtube.com/watch?v=r4ulu8wo_GI
  
    #TODO:
    # https://elixir-examples.github.io/examples/alias-use-import-require
    # https://elixir-examples.github.io/examples/behaviours
    # https://github.com/sashaafm/exads
    # Hacer ejemplo con alias import ExUnit
    # https://elixirschool.com/en/lessons/basics/collections/
    
    # API request 
    #¬†https://github.com/gogogarrett/phoenix_crud
    # https://github.com/phoenix-examples/phoenix_crud
    # ecto
    
    #Microservices
    # http://blog.plataformatec.com.br/2015/06/elixir-in-times-of-microservices/
    # https://github.com/krystianity/elixir-microservice
    # GraphQL
    # https://github.com/Ethelo/kronky
    # https://teamgaslight.com/blog/microservices-in-phoenix-part-1
    # https://www.youtube.com/watch?v=-CIMUwX1OZY
    # https://elixirforum.com/t/applications-are-components-aka-microservices-in-elixir/6884/3
  
    #Map.merge(acc, tab, fn _key, v1, v2 ->
    #List.flatten([v1|v2])
    #List.flatten
    #put_in
    #get_and_update_i
    #pipes
    #recursion
    #Enum.maps
    #unitTest
    #concurrency
    #pipe operator [fun.(item)|acc]
    # |>
    # kubernetes
    # docker 
  end