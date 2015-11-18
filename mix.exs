defmodule MyProj.MixFile do
use Mix.Project
def project do
[app: :myproj,
version: "0.0.1",
deps: deps]
end

def application do
  [mod: { MyProj.App, [] }]
end

def deps do
  [{:exos, github: "awetzel/exos"}]
end
end
