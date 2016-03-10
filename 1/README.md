#Demo 1
##What Happened?
1.	We Dynamically Resolved All The Symbols And Stored Them In A Global struct
2.	Then we wipe the nlist structure from the result Mach-O. So you didn't see any symbols
(Of course, this can be modified so that they point to wrong functions and confuse the attacker)
3.	Changed The Mach-O LC and make sure there are two LC_VERSION_MIN_MACOSX (For iOS it's **LC_VERSION_MIN_IPHONEOS**)

Try nm & Hopper now >_<