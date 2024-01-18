let irum="홍성경";
let birth=1997;
let likefood="햄버거";

let curYear=new Date().getFullYear();

//예전
let result="이름: "+irum+"\n태어난 년도: "+birth+"\n나이: "+(curYear-birth)+"\n좋아하는 음식: "+likefood;

console.log(result);

//리터럴(템플릿 리터럴 / 벡틱 '').. 중간변수 ${변수명}
let result2=`이름: ${irum}
태어난년도: ${birth}
나이: ${curYear-birth}
최애음식: ${likefood}`;

console.log(result2);
