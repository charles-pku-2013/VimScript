" ../run_ cats-and-dogs
"
"   Inspired by http://vi.stackexchange.com/a/3923/985
"

redir > cats-and-dogs.out

let s:Animal={}

function s:Animal.new(typicalSound, name)
    let l:newAnimal = copy(self)    " NOTE
    let l:newAnimal.typicalSound = a:typicalSound
    let l:newAnimal.name         = a:name
    return l:newAnimal
endfu

function s:Animal.sayName()
    echo self.typicalSound . ', I am ' . self.name
endfu

let s:Dog={}
function s:Dog.new(name)
    let    l:newDog = s:Animal.new('Wuff', a:name)
    return l:newDog
endfu

let s:Cat={}
function s:Cat.new(name)
    let    l:newCat = s:Animal.new('Meow', a:name)
    return l:newCat
endfu

let s:animal_one   = Dog.new('Charlie')
let s:animal_two   = Cat.new('Misty')
let s:animal_three = Dog.new('Daisy'  )


call s:animal_one.sayName()
"
" Wuff, I am Charlie


call s:animal_two.sayName()
"
" Meow, I am Misty


call s:animal_three.sayName()
"
" Wuff, I am Daisy

redir END

" :help numbered-function, :help dictionary-function
