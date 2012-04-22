module: hash-algorithms

define hash sha1 (20; 64);

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

