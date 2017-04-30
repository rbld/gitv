class GitV
  def initialize(src_root = nil, version_file = nil)
    @src_root = src_root || Dir.pwd
    @version_file = version_file || File.join( 'lib', 'data', 'version' )
    @abs_version_file = File.join( @src_root, @version_file )
  end

  def version
    @ver ||= retrieve_info
  end

  def cache
    FileUtils.rm_rf( @abs_version_file )
    FileUtils.mkdir_p( File.dirname( @abs_version_file ) )
    File.write( @abs_version_file, version )

    @version_file
  end

  private

  def retrieve_info
    File.directory?( File.join( @src_root, '.git' ) ) ? git_version : cached_version
  end

  def cached_version
    File.read( @abs_version_file )
  end

  def git_version
    v = %x(git describe --tags --dirty)
    if m = v.match( /^v([0-9]+)\.([0-9]+)\.([0-9]+)(.*)$/ )
      "#{m[1]}.#{m[2]}.#{m[3]}#{m[4].gsub( '-', '.' )}"
    else
      raise "Failed to parse version string #{v}"
    end
  end
end
