baseruby="/usr/bin/ruby --disable=gems"
_\
=begin
_=
ruby="${RUBY-$baseruby}"
case "$ruby" in "echo "*) $ruby; exit $?;; esac
case "$0" in /*) r=-r"$0";; *) r=-r"./$0";; esac
exec $ruby "$r" "$@"
=end
=baseruby
class Object
  remove_const :CROSS_COMPILING if defined?(CROSS_COMPILING)
  CROSS_COMPILING = RUBY_PLATFORM
  constants.grep(/^RUBY_/) {|n| remove_const n}
  RUBY_VERSION = "3.1.2"
  RUBY_RELEASE_DATE = "2022-04-12"
  RUBY_PLATFORM = "aarch64-linux"
  RUBY_PATCHLEVEL = 20
  RUBY_REVISION = "4491bb740a9506d76391ac44bb2fe6e483fec952"
  RUBY_COPYRIGHT = "ruby - Copyright (C) 1993-2022 Yukihiro Matsumoto"
  RUBY_ENGINE = "ruby"
  RUBY_ENGINE_VERSION = "3.1.2"
  RUBY_DESCRIPTION = RubyVM.const_defined?(:JIT) && RubyVM::MJIT.enabled? ?
    nil :
    "ruby 3.1.2p20 (2022-04-12 revision 4491bb740a) [aarch64-linux]"
end
builddir = File.dirname(File.expand_path(__FILE__))
srcdir = "."
top_srcdir = File.realpath(srcdir, builddir)
fake = File.join(top_srcdir, "tool/fake.rb")
eval(File.binread(fake), nil, fake)
ropt = "-r#{__FILE__}"
["RUBYOPT"].each do |flag|
  opt = ENV[flag]
  opt = opt ? ([ropt] | opt.b.split(/\s+/)).join(" ") : ropt
  ENV[flag] = opt
end
