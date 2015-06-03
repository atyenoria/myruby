require "my_libs/version"


module MyLibs


	def self.hello
    'hello gem!'
  end

  def hello2
    'hello gem! 2'
  end



class MySTDOUT < IO
def initialize(file)
@f = File.open(file,"w")
super(1,"w")
end
def close
@f.close
super
end
def write(str)
@f.write(str)
super
end
end
$stdout=MySTDOUT.new("console.log")
$stderr=MySTDOUT.new("console.log")



end
