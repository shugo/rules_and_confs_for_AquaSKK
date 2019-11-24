#!/usr/bin/env ruby

Encoding.default_external = "euc-jp"

ARGF.each_line do |line|
  first, *rest = line.chomp.split(",")
  if rest.size == 3
    f = first.
      gsub(/&comma;/, ",").
      gsub(/&sharp;/, "#").
      tr(%q{"&'()+:*}, %q{@^&*(:'"}).
      gsub(/,/,  "&comma;").
      gsub(/#/,  "&sharp;")
    puts [f, *rest].join(",")
  else
    print line
  end
end
