class VersionFilter
  def self.filter(vers_arr, cond)
    result = {}
    req = Gem::Requirement.new(cond)
    vers_arr.each do |i|
      result[i] = req.satisfied_by? Gem::Version.create(i)
    end
    result
  end
end
