module: hash-algorithms

define macro hash-definer
  { define hash ?:name (?digest-size:expression; ?block-size:expression) } =>
    {
      define C-subtype "<" ## ?name ## "-context>" (<C-void*>) end;

      define class "<" ## ?name ## ">" (<hash>)
        inherited slot digest-size = ?digest-size;
        inherited slot block-size = ?block-size;
      end;

      define method make (class == "<" ## ?name ## ">", #next next-method,
                          #rest rest, #key, #all-keys) => (hash :: "<" ## ?name ## ">")
        let result = next-method();
        let ctx = "init-" ## ?name ();
        result.context := ctx;
        result
      end;

      define method update (hash :: "<" ## ?name ## ">", input :: <byte-string>) => ()
        "update-" ## ?name (hash.context, as(<C-string>, input), input.size)
      end;

      define method digest (hash :: "<" ## ?name ## ">") => (result :: <byte-vector>)
        let res = make(<byte-vector>, size: ?digest-size);
        let storage = make(<C-unsigned-char*>, element-count: ?digest-size);
        "final-" ## ?name (storage, hash.context);
        for (i from 0 below ?digest-size)
          res[i] := as(<byte>, storage[i]);
        end;
        destroy(storage);
        res;
      end;

      define function ?name (input :: <byte-string>) => (result :: <byte-vector>)
        let ctx = make("<" ## ?name ## ">");
        update(ctx, input);
        digest(ctx)
      end
}
end;

