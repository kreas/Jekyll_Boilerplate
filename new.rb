#!/usr/bin/env ruby

# Script to create a jekyll blog post using a template. It takes one input parameter
# which is the title of the blog post
# e.g. command:
# $ ./new.rb "helper script to create new posts using jekyll"
#
# Author:Khaja Minhajuddin (http://minhajuddin.com)

# Some constants
category = ARGV[0]
title = ARGV[1]
template = ARGV[2] || "default"

TEMPLATE = "template.haml"
TARGET_DIR = category +"/_posts"

# Get the title which was passed as an argument
# Get the filename
filename = title.gsub(' ','-')
filename = "#{ Time.now.strftime('%Y-%m-%d') }-#{filename}.haml"
filepath = File.join(TARGET_DIR, filename)

# Create a copy of the template with the title replaced
new_post = File.read(TEMPLATE)
new_post.gsub!('TITLE', title);
new_post.gsub!('TEMPLATE', template);

# Write out the file to the target directory
new_post_file = File.open(filepath, 'w')
new_post_file.puts new_post
new_post_file.close

puts "created => #{filepath}"

