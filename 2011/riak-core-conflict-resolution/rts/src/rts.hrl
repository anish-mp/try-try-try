-define(PRINT(Var), io:format("DEBUG: ~p:~p - ~p~n~n ~p~n~n", [?MODULE, ?LINE, ??Var, Var])).

-define(N, 3).
-define(R, 2).
-define(W, 2).

-define(DEFAULT_TIMEOUT, 10000).

-type val() :: any().
-type proplist() :: [proplists:property()].
-type meta() :: proplist().

-record(rts_basic,      {meta   :: proplist(),
                         val    :: val()}).
-record(rts_vclock,     {meta   :: proplist(),
                         val    :: val(),
                         vclock :: vclock:vclock()}).
%% -record(rts_box,        {val    :: val(),
%%                          box    :: box()}).

-type rts_basic() :: #rts_basic{}.
-type rts_vclock() :: #rts_vclock{}.
-type rts_obj() :: rts_basic() | rts_vclock() | not_found.
-type reconcile_method() :: basic | vclock.
-type reconcile_fun() :: fun(([rts_obj()]) -> rts_obj()).
