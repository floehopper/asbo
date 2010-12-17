desc "Record MD5 of svn diff"
task :svndiffmd5 do
  File.open('svndiff.md5', 'w') do |file|
    file.puts `svn diff | md5`
  end
end

task :default => :svndiffmd5