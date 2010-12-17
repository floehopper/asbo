module Asbo

  class SvnNewFiles
  
    def initialize
      @svn_new_files = %x[svn status].map { |line| line =~ %r{^\?} ? line.delete('?').lstrip.chomp : nil }.compact
    end
  
    def to_hash
      { :svn_new_files => @svn_new_files }
    end
  
  end
  
end
