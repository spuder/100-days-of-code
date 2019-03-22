#!/usr/bin/env ruby
require "thor"
require "date"

class Entry < Thor
  include Thor::Actions

  desc "add", "Adds a log entry"
  def add
    day_one = Date.new(2019,03,14)
    entry = ["\n\n"]
    entry << "\#\#\# Day #{(Date.today()-day_one).to_i}: #{Date.today()}"
    puts "Day #{(Date.today()-day_one).to_i}"
    progress = ask("Todays Progress:")
    entry << ["\n\n"]
    entry << ["**Today's Progress:** #{progress}"]
    thoughts = ask("Thoughts: ")
    entry << ["\n\n"]
    entry << ["**Thoughts:** #{thoughts}"]
    link = ask("Link to work (markdown enabled)")
    entry << ["\n\n"]
    entry << ["**Link to work:** #{link}"]
    puts entry
    insert_into_file "log.md", "#{entry.join('')}", :after => "# 100 Days Of Code - Log"

    #TODO: get twitter api key to post automatically
    puts "D#{(Date.today()-day_one).to_i} #100DaysOfCode #{progress}" 
  end
  default_task :add

end

Entry.start(ARGV)