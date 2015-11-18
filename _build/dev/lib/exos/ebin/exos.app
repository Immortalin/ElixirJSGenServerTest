{application,exos,
             [{registered,[]},
              {description,"Create a GenServer in any language.\n\nExos contains a very simple GenServer which proxy calls and casts to a given\nport command, encoding and decoding the message to the port using erlang\nexternal binary term format. (see related projects : \nclojure|python|node_erlastic on https://github.com/awetzel)\n"},
              {applications,[kernel,stdlib,elixir,logger]},
              {vsn,"1.0.0"},
              {modules,['Elixir.Exos.Proc']}]}.