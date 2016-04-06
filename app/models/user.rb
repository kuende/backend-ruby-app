class User
  attr_accessor :profile_ref_id

  def initialize(args)
    args.each do |k, v|
      instance_variable_set("@#{k}", v)
    end
  end
end
