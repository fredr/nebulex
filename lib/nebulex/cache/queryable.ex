defmodule Nebulex.Cache.Queryable do
  @moduledoc false

  @default_page_size 10

  @doc """
  Implementation for `Nebulex.Cache.all/2`.
  """
  def all(cache, query, opts) do
    cache.__adapter__.all(cache, query || :all, opts)
  end

  @doc """
  Implementation for `Nebulex.Cache.stream/2`.
  """
  def stream(cache, query, opts) do
    opts = Keyword.put_new(opts, :page_size, @default_page_size)
    cache.__adapter__.stream(cache, query || :all, opts)
  end
end
