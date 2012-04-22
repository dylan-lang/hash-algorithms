module: sha2

define C-subtype <sha256-context> (<C-void*>) end;

define C-function init-sha256
  result context :: <sha256-context>;
  c-name: "SHA256_Init"
end;

define C-function update-sha256
  parameter context :: <sha256-context>;
  parameter data :: <C-string>;
  parameter length :: <C-int>;
  c-name: "SHA256_Update"
end;

define C-function final-sha256
  parameter hash :: <C-string>;
  parameter context :: <sha256-context>;
  c-name: "SHA256_Final"
end;

define class <sha256> (<hash>)
  inherited slot digest-size = 32;
  inherited slot block-size = 64;
end;

define method make (class == <sha256>, #next next-method,
                    #rest rest, #key, #all-keys) => (hash :: <sha256>)
  let result = next-method();
  let ctx = init-sha256();
  result.context := ctx;
  result
end;

define method update (hash :: <sha256>, input :: <byte-string>) => ()
  update-sha256(hash.context, as(<C-string>, input), input.size)
end;

define method digest (hash :: <sha256>) => (result :: <byte-vector>)
  let res = make(<byte-vector>, size: 32);
  with-stack-structure (c-hash :: <C-string>, size: 32, fill: ' ')
    final-sha256(c-hash, hash.context);
    for (x in c-hash, i from 0)
      res[i] := as(<byte>, x);
    end;
  end;
  res;
end;

define function sha256 (input :: <byte-string>) => (result :: <byte-vector>)
  let ctx = make(<sha256>);
  update(ctx, input);
  digest(ctx)
end;

define function main ()
  let arg = application-arguments()[0];
  let md = sha256(arg);
  format-out("SHA256(%s): %s\n", arg, hexdigest(md))
end;

main();


