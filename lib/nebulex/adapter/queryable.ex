defmodule Nebulex.Adapter.Queryable do
  @moduledoc """
  Specifies the query API required from adapters.
  """

  @type cache :: Nebulex.Cache.t()
  @type opts :: Nebulex.Cache.opts()

  @doc """
  Fetches all entries from cache matching the given `query`.

  If the `query` is `:all`, it streams all entries from cache; this is common
  for all adapters. However, the `query` may have any other value, which
  depends entirely on the adapter's implementation. Therefore, it is
  recommended to check out adapters documentation. For instance, the built-in
  `Nebulex.Adapters.Local` adapter supports `:ets.match_spec()` as query.

  See `Nebulex.Cache.all/2`.
  """
  @callback all(cache, query :: :all | any, opts) :: [any]

  @doc """
  Streams the given `query`.

  It returns a stream of values.

  See `Nebulex.Cache.stream/2`.
  """
  @callback stream(cache, query :: :all | any, opts) :: Enumerable.t()
end
