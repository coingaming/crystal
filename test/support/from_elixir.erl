-file("/Users/timcf/HTprojects/hm-crypto/lib/hm_cryp"
      "to/public_key.ex",
      1).

-module('Elixir.HmCrypto.PublicKey').

-compile(no_auto_import).

-spec parse_pem(rsa_key()) -> tuple().

-export_type([rsa_key/0]).

-type rsa_key() :: binary() | tuple().

-export(['__info__'/1, parse_pem/1]).

-spec '__info__'(attributes | compile | functions |
                 macros | md5 | module | deprecated) -> any().

'__info__'(module) -> 'Elixir.HmCrypto.PublicKey';
'__info__'(functions) -> [{parse_pem, 1}];
'__info__'(macros) -> [];
'__info__'(attributes) ->
    erlang:get_module_info('Elixir.HmCrypto.PublicKey',
                           attributes);
'__info__'(compile) ->
    erlang:get_module_info('Elixir.HmCrypto.PublicKey',
                           compile);
'__info__'(md5) ->
    erlang:get_module_info('Elixir.HmCrypto.PublicKey',
                           md5);
'__info__'(deprecated) -> [].

parse_pem(Vpem_string@1)
    when erlang:is_binary(Vpem_string@1) andalso
           Vpem_string@1 /= <<>> ->
    [Vpem_entry@1] = public_key:pem_decode(Vpem_string@1),
    public_key:pem_entry_decode(Vpem_entry@1);
parse_pem(Vpem@1) when erlang:is_tuple(Vpem@1) ->
    Vpem@1.
