module: md5

define C-subtype <md5-context> (<C-void*>) end;

define C-function init-md5
  result context :: <md5-context>;
  c-name: "MD5_Init"
end;

define C-function update-md5
  parameter context :: <md5-context>;
  parameter data :: <C-string>;
  parameter length :: <C-int>;
  c-name: "MD5_Update"
end;

define C-function final-md5
  parameter hash :: <C-string>;
  parameter context :: <md5-context>;
  c-name: "MD5_Final"
end;

define class <md5> (<hash>)
  inherited /* constant each-subclass */ slot digest-size /* :: <integer> */ = 16;
  inherited /* constant each-subclass */ slot block-size /* :: <integer> */ = 64;
end;

define method make (class == <md5>, #next next-method,
                    #rest rest, #key, #all-keys) => (hash :: <md5>)
  let result = next-method();
  let ctx = init-md5();
  result.context := ctx;
  result
end;

define method update (hash :: <md5>, input :: <byte-string>) => ()
  update-md5(hash.context, as(<C-string>, input), input.size)
end;

define method digest (hash :: <md5>) => (result :: <byte-vector>)
  let res = make(<byte-vector>, size: 16);
  with-stack-structure (c-hash :: <C-string>, size: 16, fill: ' ')
    final-md5(c-hash, hash.context);
    for (x in c-hash, i from 0)
      res[i] := as(<byte>, x);
    end;
  end;
  res;
end;

define function md5 (input :: <byte-string>) => (result :: <byte-vector>)
  let ctx = make(<md5>);
  update(ctx, input);
  digest(ctx)
end;

/*
define function main ()
  let arg = application-arguments()[0];
  let md = md5(arg);
  format-out("MD5(%s): %s\n", arg, hexdigest(md))
end;

main();

*/

