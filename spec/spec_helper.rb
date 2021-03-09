unless Webpacker.compiler.fresh?
    puts '== Webpack compiling =='
    Webpacker.compiler.compile
    puts '== Webpack compiled =='
end