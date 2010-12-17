module Asbo

  class SvnMissingFiles
  
    def initialize
      @svn_missing_files = %x[svn status].map { |line| line =~ %r{^\!} ? line.delete('!').lstrip.chomp : nil }.compact
    end
  
    def to_hash
      { :svn_missing_files => @svn_missing_files }
    end
  
  end
  
end
