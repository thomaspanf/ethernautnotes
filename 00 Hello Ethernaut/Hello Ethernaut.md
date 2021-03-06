
# 0. Hello Ethernaut

Intro level. Once you have your instance running, you call

>contract.info() => [[PromiseResult]]: "You will find what you need in info1()."

The PromiseResult parameter in these calls instruct you what the next calls are

>contract.info1() => [[PromiseResult]]: "Try info2(), but with \"hello\" as a parameter."

>contract.info2("hello") => [[PromiseResult]]: "The property infoNum holds the number of the next info method to call."

>contract.infoNum() => the value of the 'words' array is 42

Here, you can also type in contract.info and intellesense will tell you what all the available method calls are (info42() being one of those)

>contract.info42() => [[PromiseResult]]: "theMethodName is the name of the next method."

>contract.theMethodName() => [[PromiseResult]]: "The method name is method7123949."

>contract.method7123949() => [[PromiseResult]]: "If you know the password, submit it to authenticate()."

There are two ways you can find the password, by anlyzing the contract memory in a solidity debugger, or by typing 'contract.' and noticing that there is a password() function that gives you the password.

>contract.authenticate("ethernaut0")

The stage is complete. Pretty simple, it is a tutorial stage after all.

[Almost as satisfying as confetti in canvas](https://imgur.com/a/PROsEzC)

##

So I decided to run through and do Ethernaut again and relearn, finish what I haven't completed yet, brush up the notes, etc. This is the bread and butter. 

