module: dylan-user

define library hash-algorithms
  use dylan;
  use common-dylan;
  use io;
  use c-ffi;

  export md5;
end library;

define module md5
  use dylan;
  use common-dylan, exclude: { format-to-string };
  use dylan-extensions, import: { <byte> };
  use format-out;
  use c-ffi;

  export md5;
end module;
