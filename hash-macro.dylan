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
        with-stack-structure (c-hash :: <C-string>, size: ?digest-size, fill: ' ')
          "final-" ## ?name (c-hash, hash.context);
          for (x in c-hash, i from 0)
            res[i] := as(<byte>, x);
          end;
        end;
        res;
      end;

      define function ?name (input :: <byte-string>) => (result :: <byte-vector>)
        let ctx = make("<" ## ?name ## ">");
        update(ctx, input);
        digest(ctx)
      end
}
end;

