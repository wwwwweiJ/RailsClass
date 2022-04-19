def rendom_slug (n)
    [*'0'..'9' , *'a'..'z'].sample(n).join
   
end

 p rendom_slug(10)