/*
var: 함수형 변수
let: 영역형 변수
const: 영역형 변수
*/

//var Test: 재선언 가능, 업데이트 가능
var hello="안녕";
var hello="헬로우";
var cnt=5;

//let hello="안녕";
//let hello="헬로우";

if(cnt<6){
    var hello1="say hello";
    console.log(hello1);
}

console.log(hello1);
console.log(hello);

//let 는 영역에서만 쓰고 영역 벗어나면 지우기 위해 만들어짐

//let ..재선언불가능, 업데이트 가능
let hi="hi";
hi="하이";

let times=5;

if(times>3){
    let hi1="say Hi";
    console.log(hi1);
}

//console.log(hi1);
console.log(hi);

//const: 업데이트 안 됨. 재선언 안 됨.
//const hi3="안녕";
//hi3="하이";
const hi3={
    message: "3th say Hi",
    times:4
}
console.log(hi3);

/*
불가능
hi3={
    message: "4th say Hi",
    times:5
}

console.log(hi3);
*/

hi3.message="이렇게는 됨";
hi3.times=44;

console.log(hi3)