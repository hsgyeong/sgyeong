//배열연습
var numbers=[1,2,3,4,5];

var processed=numbers.map(function(num){
    return num*num;
})

console.log(processed);  //1,4,9,16,25

var colors=['red','green','pink','blue','purple']

colors.map((color,index)=>{
    console.log(color,index);
})