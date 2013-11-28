module: hash-algorithms
author: Hannes Mehnert
copyright: See LICENSE file in this distribution.

define class <hash> (<object>)
  /* constant */ slot context, init-keyword: context:;
  constant each-subclass slot digest-size :: <integer>;
  constant each-subclass slot block-size :: <integer>;
end;

define generic update-hash (hash :: <hash>, input :: <byte-string>) => ();

define generic digest (hash :: <hash>) => (result :: <byte-vector>);

define method hexdigest (hash :: <hash>)
 => (hexdigest :: <byte-string>)
  hexdigest(digest(hash))
end;

define method hexdigest (digest :: <byte-vector>)
 => (hexdigest :: <byte-string>)
  reduce1(concatenate,
          map-as(<vector>,
                 rcurry(integer-to-string, base:, 16, size:, 2), digest))
end;

