module: hash-algorithms-test
author: Hannes Mehnert
copyright: See LICENSE file in this distribution.

define constant test-0 = "abc";
define constant test-0a = "fff";
define constant test-0b = "foo";
define constant test-1 = "abcdbcdecdefdefgefghfghighijhijkijkljklmklmnlmnomnopnopq";
define constant test-2 = "abcdefghbcdefghicdefghijdefghijkefghijklfghijklmghijklmnhijklmnoijklmnopjklmnopqklmnopqrlmnopqrsmnopqrstnopqrstu";
define constant test-3 = "Four score and seven years ago our fathers brought forth on this continent, a new nation, conceived in Liberty, and dedicated to the proposition that all men are created equal.  Now we are engaged in a great civil war, testing whether that nation, or any nation so conceived and so dedicated, can long endure. We are met on a great battlefield of that war.  We have come to dedicate a portion of that field, as a final resting place for those who here gave their lives that that nation might live.  It is altogether fitting and proper that we should do this.  But, in a larger sense, we can not dedicate--we can not consecrate--we can not hallow--this ground.  The brave men, living and dead, who struggled here, have consecrated it, far above our poor power to add or detract.  The world will little note, nor long remember what we say here, but it can never forget what they did here.  It is for us the living, rather, to be dedicated here to the unfinished work which they who fought here have thus far so nobly advanced.  It is rather for us to be here dedicated to the great task remaining before us--that from these honored dead we take increased devotion to that cause for which they gave the last full measure of devotion--that we here highly resolve that these dead shall not have died in vain--that this nation, under God, shall have a new birth of freedom--and that government of the people, by the people, for the people, shall not perish from the earth.  -- President Abraham Lincoln, November 19, 1863";
define constant test-4 = "";
define constant test-5 = "This is exactly 64 bytes long, not counting the terminating byte";
define constant test-6 = "For this sample, this 63-byte string will be used as input data";
define constant test-7 = "And this textual data, astonishing as it may appear, is exactly 128 bytes in length, as are both SHA-384 and SHA-512 block sizes";
define constant test-8 = "By hashing data that is one byte less than a multiple of a hash block length (like this 127-byte string), bugs may be revealed.";

define test md5-test ()
  check-equal("MD5 of 0", "900150983CD24FB0D6963F7D28E17F72", hexdigest(md5(test-0)));
  check-equal("MD5 of 0a", "343D9040A671C45832EE5381860E2996", hexdigest(md5(test-0a)));
  check-equal("MD5 of 0b", "ACBD18DB4CC2F85CEDEF654FCCC4A4D8", hexdigest(md5(test-0b)));
  check-equal("MD5 of 1", "8215EF0796A20BCAAAE116D3876C664A", hexdigest(md5(test-1)));
  check-equal("MD5 of 2", "03DD8807A93175FB062DFB55DC7D359C", hexdigest(md5(test-2)));
  check-equal("MD5 of 3", "43696C3ABE0610E776CDE9BF4C052421", hexdigest(md5(test-3)));
  check-equal("MD5 of 4", "D41D8CD98F00B204E9800998ECF8427E", hexdigest(md5(test-4)));
  check-equal("MD5 of 5", "DEBCB70BF9C8E83659EF1D85AA51C5E9", hexdigest(md5(test-5)));
  check-equal("MD5 of 6", "B02752D13A05FA8D7D04AABD158FF9D1", hexdigest(md5(test-6)));
  check-equal("MD5 of 7", "268DC47E6B6F19A86481374B2CED6F18", hexdigest(md5(test-7)));
  check-equal("MD5 of 8", "50C757C2522680444582B8F4572B32F2", hexdigest(md5(test-8)));
end;

define test sha1-test ()
  check-equal("SHA1 of 0", "A9993E364706816ABA3E25717850C26C9CD0D89D", hexdigest(sha1(test-0)));
  check-equal("SHA1 of 0a", "F6949A8C7D5B90B4A698660BBFB9431503FBB995", hexdigest(sha1(test-0a)));
  check-equal("SHA1 of 0b", "0BEEC7B5EA3F0FDBC95D0DD47F3C5BC275DA8A33", hexdigest(sha1(test-0b)));
  check-equal("SHA1 of 1", "84983E441C3BD26EBAAE4AA1F95129E5E54670F1", hexdigest(sha1(test-1)));
  check-equal("SHA1 of 2", "A49B2446A02C645BF419F995B67091253A04A259", hexdigest(sha1(test-2)));
  check-equal("SHA1 of 3", "3728B3FD827FE2BFD0900E0586A03FFD3394E647", hexdigest(sha1(test-3)));
  check-equal("SHA1 of 4", "DA39A3EE5E6B4B0D3255BFEF95601890AFD80709", hexdigest(sha1(test-4)));
  check-equal("SHA1 of 5", "FB679F23E7D1CE053313E66E127AB1B444397057", hexdigest(sha1(test-5)));
  check-equal("SHA1 of 6", "4F0EA5CD0585A23D028ABDC1A6684E5A8094DC49", hexdigest(sha1(test-6)));
  check-equal("SHA1 of 7", "7E9FB243F2CB25EAB54B1217AB104D72DDEC1C6A", hexdigest(sha1(test-7)));
  check-equal("SHA1 of 8", "69E8E40E4A20B17A8DE35505E2FE6FF1FE63CC96", hexdigest(sha1(test-8)));
end;

define test sha256-test ()
  check-equal("SHA256 of 0", "BA7816BF8F01CFEA414140DE5DAE2223B00361A396177A9CB410FF61F20015AD", hexdigest(sha256(test-0)));
  check-equal("SHA256 of 0a", "F284BDC3C1C9E24A494E285CB387C69510F28DE51C15BB93179D9C7F28705398", hexdigest(sha256(test-0a)));
  check-equal("SHA256 of 0b", "2C26B46B68FFC68FF99B453C1D30413413422D706483BFA0F98A5E886266E7AE", hexdigest(sha256(test-0b)));
  check-equal("SHA256 of 1", "248D6A61D20638B8E5C026930C3E6039A33CE45964FF2167F6ECEDD419DB06C1", hexdigest(sha256(test-1)));
  check-equal("SHA256 of 2", "CF5B16A778AF8380036CE59E7B0492370B249B11E8F07A51AFAC45037AFEE9D1", hexdigest(sha256(test-2)));
  check-equal("SHA256 of 3", "4D25FCCF8752CE470A58CD21D90939B7EB25F3FA418DD2DA4C38288EA561E600", hexdigest(sha256(test-3)));
  check-equal("SHA256 of 4", "E3B0C44298FC1C149AFBF4C8996FB92427AE41E4649B934CA495991B7852B855", hexdigest(sha256(test-4)));
  check-equal("SHA256 of 5", "AB64EFF7E88E2E46165E29F2BCE41826BD4C7B3552F6B382A9E7D3AF47C245F8", hexdigest(sha256(test-5)));
  check-equal("SHA256 of 6", "F08A78CBBAEE082B052AE0708F32FA1E50C5C421AA772BA5DBB406A2EA6BE342", hexdigest(sha256(test-6)));
  check-equal("SHA256 of 7", "0AB803344830F92089494FB635AD00D76164AD6E57012B237722DF0D7AD26896", hexdigest(sha256(test-7)));
  check-equal("SHA256 of 8", "E4326D0459653D7D3514674D713E74DC3DF11ED4D30B4013FD327FDB9E394C26", hexdigest(sha256(test-8)));
end;

define test sha224-test ()
  check-equal("SHA224 of 0", "23097D223405D8228642A477BDA255B32AADBCE4BDA0B3F7E36C9DA7", hexdigest(sha224(test-0)));
  check-equal("SHA224 of 0a", "989BBBBF896250F1B2AEB753BFBD6B81056305EC21E2F9041D9EA007", hexdigest(sha224(test-0a)));
  check-equal("SHA224 of 0b", "0808F64E60D58979FCB676C96EC938270DEA42445AEEFCD3A4E6F8DB", hexdigest(sha224(test-0b)));
  check-equal("SHA224 of 1", "75388B16512776CC5DBA5DA1FD890150B0C6455CB4F58B1952522525", hexdigest(sha224(test-1)));
  check-equal("SHA224 of 2", "C97CA9A559850CE97A04A96DEF6D99A9E0E0E2AB14E6B8DF265FC0B3", hexdigest(sha224(test-2)));
  check-equal("SHA224 of 3", "62A41AB0961BCDD22DB70B896DB3955C1D04096AF6DE47F5AAAD1226", hexdigest(sha224(test-3)));
  check-equal("SHA224 of 4", "D14A028C2A3A2BC9476102BB288234C415A2B01F828EA62AC5B3E42F", hexdigest(sha224(test-4)));
  check-equal("SHA224 of 5", "D92622D56F83D869A884F6CC0763E90C4520A21E1CC429841E4584D2", hexdigest(sha224(test-5)));
  check-equal("SHA224 of 6", "0873433E1C8749DAD0E34F92AFF11C4B2CA310356283817747AA6940", hexdigest(sha224(test-6)));
  check-equal("SHA224 of 7", "5A69CCCA0B5E7F84EFDA7C026D010FA46569C03F97B4440EBA32B941", hexdigest(sha224(test-7)));
  check-equal("SHA224 of 8", "49E54148D21D457F2FFE28532543D91DA98724C9883E67682301DEC4", hexdigest(sha224(test-8)));
end;

define test sha384-test ()
  check-equal("SHA384 of 0", "CB00753F45A35E8BB5A03D699AC65007272C32AB0EDED1631A8B605A43FF5BED8086072BA1E7CC2358BAECA134C825A7", hexdigest(sha384(test-0)));
  check-equal("SHA384 of 0a", "997730F6F7C761B0F75262A1E2FB8319CFC0D28DE212ADDC27C10029C966B4186FBD85AFBFE25D18BDA78A09C0544B5B", hexdigest(sha384(test-0a)));
  check-equal("SHA384 of 0b", "98C11FFDFDD540676B1A137CB1A22B2A70350C9A44171D6B1180C6BE5CBB2EE3F79D532C8A1DD9EF2E8E08E752A3BABB", hexdigest(sha384(test-0b)));
  check-equal("SHA384 of 1", "3391FDDDFC8DC7393707A65B1B4709397CF8B1D162AF05ABFE8F450DE5F36BC6B0455A8520BC4E6F5FE95B1FE3C8452B", hexdigest(sha384(test-1)));
  check-equal("SHA384 of 2", "09330C33F71147E83D192FC782CD1B4753111B173B3B05D22FA08086E3B0F712FCC7C71A557E2DB966C3E9FA91746039", hexdigest(sha384(test-2)));
  check-equal("SHA384 of 3", "69CC75B95280BDD9E154E743903E37B1205AA382E92E051B1F48A6DB9D0203F8A17C1762D46887037275606932D3381E", hexdigest(sha384(test-3)));
  check-equal("SHA384 of 4", "38B060A751AC96384CD9327EB1B1E36A21FDB71114BE07434C0CC7BF63F6E1DA274EDEBFE76F65FBD51AD2F14898B95B", hexdigest(sha384(test-4)));
  check-equal("SHA384 of 5", "E28E35E25A1874908BF0958BB088B69F3D742A753C86993E9F4B1C4C21988F958BD1FE0315B195ACA7B061213AC2A9BD", hexdigest(sha384(test-5)));
  check-equal("SHA384 of 6", "37B49EF3D08DE53E9BD018B0630067BD43D09C427D06B05812F48531BCE7D2A698EE2D1ED1FFED46FD4C3B9F38A8A557", hexdigest(sha384(test-6)));
  check-equal("SHA384 of 7", "E3E3602F4D90C935321D788F722071A8809F4F09366F2825CD85DA97CCD2955EB6B8245974402AA64789ED45293E94BA", hexdigest(sha384(test-7)));
  check-equal("SHA384 of 8", "1CA650F38480FA9DFB5729636BEC4A935EBC1CD4C0055EE50CAD2AA627E066871044FD8E6FDB80EDF10B85DF15BA7AAB", hexdigest(sha384(test-8)));
end;

define test sha512-test ()
  check-equal("SHA512 of 0", "DDAF35A193617ABACC417349AE20413112E6FA4E89A97EA20A9EEEE64B55D39A2192992A274FC1A836BA3C23A3FEEBBD454D4423643CE80E2A9AC94FA54CA49F", hexdigest(sha512(test-0)));
  check-equal("SHA512 of 0a", "D1D7E84D9049900299EE9C0B2C04B11BFA9A0437AFC0BF03D8CE0E3FB8523919F13FA3A5130C5BA7987679C6F6945CA87655E746EB5345BDC8131298FA5A9B20", hexdigest(sha512(test-0a)));
  check-equal("SHA512 of 0b", "F7FBBA6E0636F890E56FBBF3283E524C6FA3204AE298382D624741D0DC6638326E282C41BE5E4254D8820772C5518A2C5A8C0C7F7EDA19594A7EB539453E1ED7", hexdigest(sha512(test-0b)));
  check-equal("SHA512 of 1", "204A8FC6DDA82F0A0CED7BEB8E08A41657C16EF468B228A8279BE331A703C33596FD15C13B1B07F9AA1D3BEA57789CA031AD85C7A71DD70354EC631238CA3445", hexdigest(sha512(test-1)));
  check-equal("SHA512 of 2", "8E959B75DAE313DA8CF4F72814FC143F8F7779C6EB9F7FA17299AEADB6889018501D289E4900F7E4331B99DEC4B5433AC7D329EEB6DD26545E96E55B874BE909", hexdigest(sha512(test-2)));
  check-equal("SHA512 of 3", "23450737795D2F6A13AA61ADCCA0DF5EEF6DF8D8DB2B42CD2CA8F783734217A73E9CABC3C9B8A8602F8AEAEB34562B6B1286846060F9809B90286B3555751F09", hexdigest(sha512(test-3)));
  check-equal("SHA512 of 4", "CF83E1357EEFB8BDF1542850D66D8007D620E4050B5715DC83F4A921D36CE9CE47D0D13C5D85F2B0FF8318D2877EEC2F63B931BD47417A81A538327AF927DA3E", hexdigest(sha512(test-4)));
  check-equal("SHA512 of 5", "70AEFEAA0E7AC4F8FE17532D7185A289BEE3B428D950C14FA8B713CA09814A387D245870E007A80AD97C369D193E41701AA07F3221D15F0E65A1FF970CEDF030", hexdigest(sha512(test-5)));
  check-equal("SHA512 of 6", "B3DE4AFBC516D2478FE9B518D063BDA6C8DD65FC38402DD81D1EB7364E72FB6E6663CF6D2771C8F5A6DA09601712FB3D2A36C6FFEA3E28B0818B05B0A8660766", hexdigest(sha512(test-6)));
  check-equal("SHA512 of 7", "97FB4EC472F3CB698B9C3C12A12768483E5B62BCDAD934280750B4FA4701E5E0550A80BB0828342C19631BA55A55E1CEE5DE2FDA91FC5D40E7BEE1D4E6D415B3", hexdigest(sha512(test-7)));
  check-equal("SHA512 of 8", "D399507BBF5F2D0DA51DB1FF1FC51C1C9FF1DE0937E00D01693B240E84FCC3400601429F45C297ACC6E8FCF1E4E4ABE9FF21A54A0D3D88888F298971BD206CD5", hexdigest(sha512(test-8)));
end;
