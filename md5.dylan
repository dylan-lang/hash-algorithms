module: md5


define C-function md5-init
  result context :: <C-void*>;
  c-name: "md5_init"
end;

define C-function md5-loop
  parameter context :: <C-void*>;
  parameter data :: <C-string>;
  parameter length :: <C-int>;
  c-name: "md5_loop"
end;

define C-function md5-pad
  parameter context :: <C-void*>;
  c-name: "md5_pad"
end;

define C-function md5-result
  parameter context :: <C-void*>;
  result hash :: <C-string>;
  c-name: "md5_result"
end;

define method md5 (input :: <byte-string>) => (result :: <byte-vector>)
  md5(as(<byte-vector>, input))
end;

define method md5 (input :: <byte-vector>) => (result :: <byte-vector>)
  md5-internal(input);
end;

define function md5-internal (x :: <byte-vector>) => (result :: <byte-vector>)
  let ctx = md5-init();
  md5-loop(ctx, x, x.size);
  md5-pad(ctx);
  md5-result(ctx)
end;

define function main ()
  let arg = application-arguments()[0];
  format-out("MD5(%s): %s\n", arg, md5(arg))
end;



