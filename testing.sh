cat "../../story/ces_story" | hfst-proc ces-rus.automorf.hfst | cg-proc ces-rus.rlx.bin | apertium-tagger -g ces-rus.prob |\
   apertium-pretransfer | lt-proc -b ces-rus.autobil.bin | apertium-lrx-proc ces-rus.lrx.bin  |\
   apertium-transfer -b apertium-ces-rus.ces-rus.t1x ces-rus.t1x.bin 