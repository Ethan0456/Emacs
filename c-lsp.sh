#!/bin/bash
exec /opt/homebrew/bin/ccls --init='{"clang":{"extraArgs":[
  "-isystem/Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/include/c++/v1",
  "-isystem/Library/Developer/CommandLineTools/usr/lib/clang/13.1.6/include",
  "-isystem/Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/include",
  "-isystem/Library/Developer/CommandLineTools/usr/include",
  "-isystem/Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/System/Library/Frameworks"
]}}' "$@"
