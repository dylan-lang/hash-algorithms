module: dylan-user
author: Hannes Mehnert
copyright: See LICENSE file in this distribution.

define library hash-algorithms
  use dylan;
  use common-dylan;
  use c-ffi;

  export hash-algorithms;
end library;

define module hash-algorithms
  use dylan;
  use common-dylan, exclude: { format-to-string };
  use dylan-extensions, import: { <byte> };
  use c-ffi;

  export
    <hash>,
    digest-size, block-size,
    update-hash,
    digest,
    hexdigest;

  export <md5>, md5;
  export <sha1>, sha1;
  export <sha256>, sha256;
  export <sha224>, sha224;
  export <sha384>, sha384;
  export <sha512>, sha512;
end;

