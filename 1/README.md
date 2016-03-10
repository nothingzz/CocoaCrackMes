#Demo 1
##What Happened?
>>We Dynamically Resolved All The Symbols And Stored Them In A Global struct
>>Then we wipe the nlist structure from the result Mach-O. So you didn't see any symbols
(Of course, this can be modified so that they point to wrong functions and confuse the attacker)