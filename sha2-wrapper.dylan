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
  parameter hash :: <C-unsigned-char*>;
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
  parameter hash :: <C-unsigned-char*>;
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
  parameter hash :: <C-unsigned-char*>;
  parameter context :: <sha512-context>;
  c-name: "SHA512_Final"
end;

