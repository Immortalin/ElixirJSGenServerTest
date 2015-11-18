defmodule Account do
  def cmd do
    case Application.get_env(:account_impl) do
      :python-> "venv/bin/python -u account.py"
      :node-> "node account.js"
      :clojure-> "java -cp 'target/*' clojure.main account.clj"
    end
  end
  def start_link(ini), do: Exos.Proc.start_link(cmd,ini,[cd: "#{:code.priv_dir(:myproj)}/account"],name: __MODULE__)
  def add(v), do: GenServer.cast(__MODULE__,{:add,v})
  def rem(v), do: GenServer.cast(__MODULE__,{:rem,v})
  def get, do: GenServer.call(__MODULE__,:get,:infinity)
end

defmodule MyProj.App do
  use Application
  def start(_,_), do: MyProj.App.Sup.start_link

  defmodule Sup do
    use Supervisor
    def start_link, do: Supervisor.start_link(__MODULE__,[])
    def init([]), do: supervise([
      worker(Account,0)
    ], strategy: :one_for_one)
  end
end
