require 'rexml/document'

module Asbo

  class SvnBaseRevision
  
    def initialize
      svn_log = `svn log --revision BASE --xml`
      document = REXML::Document.new(svn_log) rescue nil
      @svn_base_revision = document.elements['/log/logentry'].attributes['revision'] rescue nil
    end
  
    def to_hash
      { :svn_base_revision => @svn_base_revision }
    end
  
  end
  
end