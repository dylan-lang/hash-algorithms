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

define function md5 (input :: <byte-string>) => (result :: <byte-vector>)
  let ctx = init-md5();
  update-md5(ctx, as(<C-string>, input), input.size);
  let res = make(<byte-vector>, size: 16);
  with-stack-structure (hash :: <C-string>, size: 16, fill: ' ')
    final-md5(hash, ctx);
    for (x in hash, i from 0)
      res[i] := as(<byte>, x);
    end;
  end;
  res;
end;

/*
define function main ()
  let arg = application-arguments()[0];
  let md = md5(arg);
  let r = "";
  for (x in md)
    r := concatenate(r, integer-to-string(x, base: 16))
  end;
  format-out("MD5(%s): %s\n", arg, r)
end;

main();
*/
