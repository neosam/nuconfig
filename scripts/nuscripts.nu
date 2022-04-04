def "from foobar" [] {
  lines | split column "foobar"
}

def gitlog [] {
  git log --pretty=%h»¦«%s»¦«%aN»¦«%aE»¦«%aD 
   | lines 
   | split column '»¦«' sha1 message name email date 
   | upsert date {|line| $line.date | into datetime }
}

