import os

template pkg1(name: string; hasDeps = false; cmd = "nimble test"; url = ""): untyped =
  packages1.add((name, cmd, hasDeps, url))

template pkg2(name: string; hasDeps = false; cmd = "nimble test"; url = ""): untyped =
  packages2.add((name, cmd, hasDeps, url))

var packages1*: seq[tuple[name, cmd: string; hasDeps: bool; url: string]] = @[]
var packages2*: seq[tuple[name, cmd: string; hasDeps: bool; url: string]] = @[]


# packages A-M
pkg1 "argparse"
pkg1 "arraymancer", true, "nim c tests/tests_cpu.nim"
pkg1 "ast_pattern_matching", false, "nim c -r --oldgensym:on tests/test1.nim"
pkg1 "asyncmysql", true
pkg1 "bigints"
pkg1 "binaryheap", false, "nim c -r binaryheap.nim"
# pkg1 "blscurve", true # pending https://github.com/status-im/nim-blscurve/issues/39
pkg1 "bncurve", true
pkg1 "c2nim", false, "nim c testsuite/tester.nim"
pkg1 "cascade"
pkg1 "chroma"
pkg1 "chronicles", true, "nim c -o:chr -r chronicles.nim"
when not defined(osx): # testdatagram.nim(560, 54): Check failed
  pkg1 "chronos", true
pkg1 "cligen", false, "nim c -o:cligenn -r cligen.nim"
pkg1 "coco", true
pkg1 "combparser"
pkg1 "compactdict"
pkg1 "comprehension", false, "nimble test", "https://github.com/alehander42/comprehension"
pkg1 "criterion"
pkg1 "dashing", false, "nim c tests/functional.nim"
pkg1 "docopt"
pkg1 "easygl", true, "nim c -o:egl -r src/easygl.nim", "https://github.com/jackmott/easygl"
pkg1 "elvis"
pkg1 "fidget", true, "nim c -r tests/runNative.nim"
pkg1 "fragments", false, "nim c -r fragments/dsl.nim"
pkg1 "gara"
pkg1 "ggplotnim", true, "nimble testCI"
pkg1 "glob"
pkg1 "gnuplot"
pkg1 "hts", false, "nim c -o:htss src/hts.nim"
pkg1 "illwill", false, "nimble examples"
# pkg1 "inim", true # pending https://github.com/inim-repl/INim/issues/74
pkg1 "itertools", false, "nim doc src/itertools.nim"
pkg1 "iterutils"
pkg1 "jstin"
pkg1 "karax", false, "nim c -r tests/tester.nim"
pkg1 "loopfusion"
pkg1 "macroutils"
pkg1 "msgpack4nim"


# packages N-Z
pkg2 "nake", false, "nim c nakefile.nim"
pkg2 "neo", true, "nim c -d:blas=openblas tests/all.nim"
pkg2 "nesm"
# pkg2 "nico", true
pkg2 "nicy", false, "nim c -r src/nicy.nim"
when defined(osx):
  # xxx: do this more generally by installing non-nim dependencies automatically
  # as specified in nimble file and calling `distros.foreignDepInstallCmd`, but
  # it currently would fail work if a package is already installed.
  doAssert execShellCmd("brew ls --versions gtk+3 || brew install gtk+3") == 0
pkg2 "nigui", false, "nim c -o:niguii -r src/nigui.nim"
pkg2 "nimcrypto", false, "nim c -r tests/testall.nim"
pkg2 "NimData", true, "nim c -o:nimdataa src/nimdata.nim"
pkg2 "nimes", true, "nim c src/nimes.nim"
pkg2 "nimfp", true, "nim c -o:nfp -r src/fp.nim"
pkg2 "nimgame2", true, "nim c nimgame2/nimgame.nim"
pkg2 "nimgen", true, "nim c -o:nimgenn -r src/nimgen/runcfg.nim"
pkg2 "nimlsp", true
pkg2 "nimly", true
# pkg2 "nimongo", true, "nimble test_ci"
# pkg2 "nimph", true, "nimble test", "https://github.com/disruptek/nimph"
pkg2 "nimpy", false, "nim c -r tests/nimfrompy.nim"
pkg2 "nimquery"
pkg2 "nimsl", true
pkg2 "nimsvg"
# pkg2 "nimterop", true
pkg2 "nimx", true, "nim c --threads:on test/main.nim"
pkg2 "nitter", true, "nim c src/nitter.nim", "https://github.com/zedeus/nitter"
pkg2 "norm", true, "nim c -r tests/tsqlite.nim"
pkg2 "npeg"
pkg2 "optionsutils"
pkg2 "ormin", true, "nim c -o:orminn ormin.nim"
pkg2 "parsetoml"
pkg2 "patty"
pkg2 "plotly", true, "nim c --oldgensym:on examples/all.nim"
pkg2 "pnm"
pkg2 "polypbren"
pkg2 "prologue", true, "nim c -r tests/test_compile/test_compile.nim"
pkg2 "protobuf", true, "nim c -o:protobuff -r src/protobuf.nim"
pkg2 "pylib"
pkg2 "rbtree"
pkg2 "react", false, "nimble example"
pkg2 "regex", true, "nim c src/regex"
pkg2 "result", false, "nim c -r result.nim"
pkg2 "rosencrantz", false, "nim c -o:rsncntz -r rosencrantz.nim"
pkg2 "sdl1", false, "nim c -r src/sdl.nim"
pkg2 "sdl2_nim", false, "nim c -r sdl2/sdl.nim"
pkg2 "snip", false, "nimble test", "https://github.com/genotrance/snip"
pkg2 "stint", false, "nim c -o:stintt -r stint.nim"
pkg2 "strunicode", true, "nim c -r src/strunicode.nim"
pkg2 "telebot", true, "nim c -o:tbot -r src/telebot.nim"
pkg2 "tempdir"
pkg2 "templates"
pkg2 "tensordsl", false, "nim c -r tests/tests.nim", "https://krux02@bitbucket.org/krux02/tensordslnim.git"
pkg2 "termstyle"
pkg2 "timeit"
pkg2 "timezones"
pkg2 "tiny_sqlite"
pkg2 "unicodedb"
pkg2 "unicodeplus", true
pkg2 "unpack"
pkg2 "websocket", false, "nim c websocket.nim"
# pkg2 "winim", true
pkg2 "with"
pkg2 "ws"
pkg2 "yaml"
pkg2 "zero_functional", false, "nim c -r test.nim"
