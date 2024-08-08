// url 데이터 가져오기
const headerUrlParams = new URL(location.href).searchParams;
const headerYear = headerUrlParams.get('year');
const headerMonth = headerUrlParams.get('month');
const headerDate = headerUrlParams.get('date');
const headerGrade = headerUrlParams.get('grade');

// 오늘 날짜 받아오기
const date = new Date();
const viewYear = date.getFullYear();
const viewMonth = date.getMonth() + 1;
const viewdate = date.getDate();
const viewDay= date.getDay();

// 정규표현식
const regKor = /^[가-힣]{1,8}$/;
const regPhone = /^\d{2,3}\d{3,4}\d{4}$/;
const regPW = /^.{4,20}$/;
const regId = /^.{1,20}$/;
const regScheduleTitle = /^.{1,10}$/;
const regMemberIdx = /^[12]$/;
const regYear = /^\d{4}$/;

console.log(regYear.test("ㄱ"))
console.log(regYear.test(199))
console.log(regYear.test(2500))