require 'svn_diff_md5'
require 'svn_base_revision'

require 'yaml'

module Asbo
  
  class Sample
  
    def self.load(filename)
      new(YAML.load(File.open(filename)))
    end
    
    def self.record
      recorders = [SvnDiffMd5.new, SvnBaseRevision.new]
      new(recorders.inject({}) { |data, input| data.merge(input) })
    end
  
    def initialize(data = {})
      @data = data
    end
    
    def diff(other)
      @data.dup.delete_if { |k, v| other.data[k] == v }.merge(other.data.dup.delete_if { |k, v| @data.has_key?(k) })
    end
    
    def save(filename)
      File.open(filename, 'w') { |file| file.puts(@data.to_yaml) }
    end
    
    attr_reader :data
    protected :data
    
  end
  
end
