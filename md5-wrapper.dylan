module: hash-algorithms

define hash md5 (16; 64);

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

