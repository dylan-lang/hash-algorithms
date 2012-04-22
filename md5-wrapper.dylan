module: md5


define C-function init-md5
  result context :: <C-void*>;
  c-name: "MD5_Init"
end;

define C-function update-md5
  parameter context :: <C-void*>;
  parameter data :: <C-string>;
  parameter length :: <C-int>;
  c-name: "MD5_Update"
end;

define C-function final-md5
  parameter context :: <C-void*>;
  result hash :: <C-string>;
  c-name: "MD5_Final"
end;

define method md5 (input :: <byte-string>) => (result :: <byte-string>)
  md5(as(<byte-vector>, input))
end;

define method md5 (input :: <byte-vector>) => (result :: <byte-string>)
  md5-internal(input);
end;

define function md5-internal (x :: <byte-vector>) => (result :: <byte-string>)
  let ctx = init-md5();
  update-md5(ctx, as(<C-string>, x), x.size);
  as(<byte-string>, final-md5(ctx))
end;

define function main ()
  let arg = application-arguments()[0];
  format-out("MD5(%s): %s\n", arg, md5(arg))
end;

main();

