module: sha1

define C-subtype <sha1-context> (<C-void*>) end;

define C-function init-sha1
  result context :: <sha1-context>;
  c-name: "SHA1_Init"
end;

define C-function update-sha1
  parameter context :: <sha1-context>;
  parameter data :: <C-string>;
  parameter length :: <C-int>;
  c-name: "SHA1_Update"
end;

define C-function final-sha1
  parameter hash :: <C-string>;
  parameter context :: <sha1-context>;
  c-name: "SHA1_Final"
end;

define class <sha1> (<hash>)
  inherited slot digest-size = 20;
  inherited slot block-size = 64;
end;

define method make (class == <sha1>, #next next-method,
                    #rest rest, #key, #all-keys) => (hash :: <sha1>)
  let result = next-method();
  let ctx = init-sha1();
  result.context := ctx;
  result
end;

define method update (hash :: <sha1>, input :: <byte-string>) => ()
  update-sha1(hash.context, as(<C-string>, input), input.size)
end;

define method digest (hash :: <sha1>) => (result :: <byte-vector>)
  let res = make(<byte-vector>, size: 20);
  with-stack-structure (c-hash :: <C-string>, size: 20, fill: ' ')
    final-sha1(c-hash, hash.context);
    for (x in c-hash, i from 0)
      res[i] := as(<byte>, x);
    end;
  end;
  res;
end;

define function sha1 (input :: <byte-string>) => (result :: <byte-vector>)
  let ctx = make(<sha1>);
  update(ctx, input);
  digest(ctx)
end;

define function main ()
  let arg = application-arguments()[0];
  let md = sha1(arg);
  format-out("SHA1(%s): %s\n", arg, hexdigest(md))
end;

main();



