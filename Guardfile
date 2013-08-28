# A sample Guardfile
# More info at https://github.com/guard/guard#readme

# Add files and commands to this file, like the example:
#   watch(%r{file/path}) { `command(s)` }
#
guard :shell, :all_on_start => true do
    watch /(.*).hs$/ do |m| 
        # Each time a haskell file gets written, check its syntax.
        if system("ghc -e :q #{m[0]}")
            n m[0], 'OK', :success
        else
            n m[0], 'ERROR', :success
        end
    end
end
