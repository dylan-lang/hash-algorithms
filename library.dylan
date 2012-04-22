module: dylan-user

define library hash-algorithms
  use common-dylan;
  use io;
  use c-ffi;

  export md5;
end library;

define module md5
  use common-dylan, exclude: { format-to-string };
  use format-out;
  use c-ffi;

  export md5;
end module;
