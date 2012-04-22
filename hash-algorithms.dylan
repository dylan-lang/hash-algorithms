module: hash-algorithms

define class <hash> (<object>)
  /* constant */ slot context, init-keyword: context:;
  constant each-subclass slot digest-size :: <integer>;
  constant each-subclass slot block-size :: <integer>;
end;

define generic update (hash :: <hash>, input :: <byte-string>) => ();

define generic digest (hash :: <hash>) => (result :: <byte-vector>);

define function hexdigest (digest :: <byte-vector>)
 => (hexdigest :: <byte-string>)
  reduce1(concatenate,
          map-as(<vector>, rcurry(integer-to-string, base:, 16), digest));
end;

