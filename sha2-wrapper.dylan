module: hash-algorithms

define hash sha256 (32; 64);

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

define hash sha384 (48; 128);

define C-function init-sha384
  result context :: <sha384-context>;
  c-name: "SHA384_Init"
end;

define C-function update-sha384
  parameter context :: <sha384-context>;
  parameter data :: <C-string>;
  parameter length :: <C-int>;
  c-name: "SHA384_Update"
end;

define C-function final-sha384
  parameter hash :: <C-string>;
  parameter context :: <sha384-context>;
  c-name: "SHA384_Final"
end;

define hash sha512 (64; 128);

define C-function init-sha512
  result context :: <sha512-context>;
  c-name: "SHA512_Init"
end;

define C-function update-sha512
  parameter context :: <sha512-context>;
  parameter data :: <C-string>;
  parameter length :: <C-int>;
  c-name: "SHA512_Update"
end;

define C-function final-sha512
  parameter hash :: <C-string>;
  parameter context :: <sha512-context>;
  c-name: "SHA512_Final"
end;


define method main ()
  let arg = application-arguments()[0];
  let m = md5(arg);
  let s1 = sha1(arg);
  let s2 = sha256(arg);
  let s3 = sha384(arg);
  let s5 = sha512(arg);
  format-out("string: %s\nMD5: %s\nSHA1: %s\nSHA256: %s\nSHA384: %s\nSHA512: %s\n",
             arg, hexdigest(m), hexdigest(s1), hexdigest(s2), hexdigest(s3), hexdigest(s5));
end;

main();


