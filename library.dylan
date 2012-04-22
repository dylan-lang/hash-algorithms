module: dylan-user

define library hash-algorithms
  use dylan;
  use common-dylan;
  use io;
  use c-ffi;

  export hash-algorithms, md5, sha1, sha2;
end library;

define module hash-algorithms
  use dylan;
  use common-dylan, import: { integer-to-string, <byte-vector> };

  export
    <hash>, context, context-setter,
    digest-size, block-size,
    update, digest,
    hexdigest;
end;

define module md5
  use dylan;
  use common-dylan, exclude: { format-to-string };
  use dylan-extensions, import: { <byte> };
  use format-out;
  use c-ffi;
  use hash-algorithms;

  export <md5>, md5;
end module;

define module sha1
  use dylan;
  use common-dylan, exclude: { format-to-string };
  use dylan-extensions, import: { <byte> };
  use format-out;
  use c-ffi;
  use hash-algorithms;

  export <sha1>, sha1;
end module;

define module sha2
  use dylan;
  use common-dylan, exclude: { format-to-string };
  use dylan-extensions, import: { <byte> };
  use format-out;
  use c-ffi;
  use hash-algorithms;

  export <sha256>, sha256;
end module;

