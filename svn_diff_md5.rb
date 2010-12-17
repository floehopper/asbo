require 'digest/md5'

module Asbo

  class SvnDiffMd5
  
    def initialize
      svn_diff = `svn diff`
      if svn_diff.strip.empty?
        @svn_diff_md5 = nil
      else
        @svn_diff_md5 = Digest::MD5.hexdigest(svn_diff) rescue nil
      end
    end
  
    def to_hash
      { :svn_diff_md5 => @svn_diff_md5 }
    end
  
  end

end