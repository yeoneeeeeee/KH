import './App.css';
import {Lifecycle} from './01_Lifecycle';
import PropsDatatype from './02_PropsDataType';
/* 
  리액트란? 컴포넌트
  UI를 구축하는 JS라이브러리 겸 프레임워크. 동적으로 사용자가 보게될 화면을 꾸밀수
  있다.

  컴포넌트?
  UI구성을 확정성있고, 유연하게 만들어주기 위해 만들어짐. 화면을 이루는 구성요소
  하나하나를 컴포넌트라는 블럭단위로 포장해서 재사용성을 늘렸다.

  리액트에서는 화면의 모든 구성요소를 컴포넌트로 표현할수 있다.

  JSX(JavaScriptXML)문법 : Javascript의 문법 안에서 html요소가 함께 들어가있는 형태의
  언어. 리액트에서 ui를 구성하기위해 보편적으로 사용되는 문법. 자바스크립트의 문법을
  통해 HTML요소를 생성하는 역할을 함.

  const div = document.createElement("div"); --> (명령적 방식)
  const h2 = document.createElement("h2");
  div.appendChild(h2);

  JSX문법은 선언적 방식. 개발자가 복잡한 자바스크립트 코드를 짤 필요 없이 동적으로
  추가되는 DOM요소를 단순한 코드 선언만으로 만들수 있다. 

  <div>
    <h2></h2>
  </div>

  내가 작성한 JSX문법의 코드가 실제로 실행될때는 리액트가 브라우저에서 구동되고있는
  자바스크립트 코드로 자동으로 컴파일 되면서 실행이 된다.
*/


function App() {
  //자바스크립트 영역
  <h2>js영역</h2>  

  const str = "Hello World";
  return (
    <div>
        {/* jsx문법 영역 안에서 주석을 사용하는 방법. jsx문법안에서의 중괄호는
            js영역으로 인식이 됨  */}
        {/* <h2>{str}</h2> */}
        {/* <Lifecycle props_value="From App.js" /> */}
        {/* 
          props? 부모컴포넌트가 자식컴포넌트에 넘겨주는 "객체" 형태의 데이터
          자식컴포넌트의 시작태그에 작성하는 속성은 key값으로, 속성값은 value값의
          형태로 넘어간다.
        */}
        <PropsDatatype 
          String="react"
          Number={100}
          Boolean
          Array={[0,1,8]}
          Object={{react:"리액트",today:20230724}}
          Function={ console.log }                    
        >
        </PropsDatatype>
    </div>
  );
}

export default App;
