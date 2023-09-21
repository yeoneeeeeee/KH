/* 
    1. react모듈에서 default옵션을 사용해서 Component를 export했다면
    import 모듈명 from '모율경로';

    2. react모듈에서 default옵션을 지정하지 않고 export했다면
    import {가져올 객체} from '모듈경로';
*/
import { Component } from "react";
// 현재 클래스를 Component로 만들기 위해 필요한 클래스

/* 
    Component의 생명주기(생성, 변경, 소멸)와 관련된 함수중 "생성"과정과
    연관된 함수

    1. render() : return되는 html형식의 코드를 화면에 그려주는 함수(랜더링)
                  화면에 내용이 변경되어야할 시점에 자동으로 호출됨.
    
    2. constructor(props) : 생성자 함수로 생명주기 함수들중 가장 먼저 실행
    되며 처음 딱 한번만 실행됨.
    component내부에서 사용되는 변수(state)를 선언하고 부모객체에서
    전달받은 변수(props)를 초기화할때 사용된다.
    super()함수는 생성자 함수 가장위에서 호출함(자바와동일)

    3. getDerviedStateFromProps(props, state) : construtor()함수 호출 
    다음과, render함수 호출 직전에 실행되는 함수.

    컴포넌트가 새로운 props를 받게 됐을때 state값을 변경해줌.

    4. componentDidMount() : 생성과 관련된 함수들중 가장 '마지막'에 실행됨. 화면이
    만들어지고나서 할수있는 작업인 이벤트부여나, 초기화작업시 활용되는 메서드

    초기화시에는 setState()함수를 활용함.
    - setState() : 현재 컴포넌트의 state값을 변경해주며, state값 변경시 render함수가
    자동으로 호출됨.

    ============================================================================

    Component의 생명주기 함수중 '변경'과정과 연관된 함수

    5. shouldComponentUpdate : props, state가 새로운값으로 갱신되어서 render()메서드가
    호출되어야 하는 시점을 감지하여서 컴포넌트를 업데이트 할지 말지 여부를 결정하는 함수.

    반환값은 true/false로 설정하여서 true값 반환시에는 render메서드를 호출하고, false
    값 반환시에는 render함수를 호출하지 않음.
    주의사항 : 초기 랜더링, 강제업데이트시에는 호출되지 않는다. 

    @ 6. componentDidUpdate() : 컴포넌트가 실제화면에 출견된 이후에 실행.
    부모 컴포넌트로부터 전달된 이전 props와 이전state를 인자로 전달받음

    =====================================================================
    소멸과정과 연관된 함수
    @ 7. componentWillUnmount : 컴포넌트가 제거되기 직전에 수행


*/
class Lifecycle extends Component{

    static getDerivedStateFromProps(props, state){

        console.log("2. getDerivedStateFromProps 호출 ");
        console.log(props, state);

        return {tmp_state : props.props_value};
    }

    componentDidMount(){
        console.log("4. componentDidMount() 호출");

        this.setState({tmp_state2:true});

    }

    shouldComponentUpdate(props, state){
        console.log("5. shouldComponentUpdate 호출 / tmp_state2 = "+state.tmp_state2);
        return state.tmp_state2;
    }

    constructor(props){
        super(props); // props? 부모 컴포넌트로부터 전달받은 데이터

        this.state = {};
        /*
            state? 컴포넌트 내부에서 전역변수로 저장할 객체
            컴포넌트 내부에서 state에 값을 저장하고 변경하면서 화면을 다시
            그려줄 목적으로 사용한다.
            ex) 일반 게시글에서 총 댓글 숫자를 저장하고, 새로운 댓글이 달
            리면 댓글숫자를 증가시켜주면서 화면을 랜더링 시킨다.
        */
       console.log("1. constructor()호출 ");
    }

    render(){
        console.log("3. render함수 호출");
        console.log(this.state);
        return(
            <h2>render 함수 호출</h2>
        )
    }
}

/*
    작성한 컴포넌트를 내보내는 방법
    1. export default 객체명; 
    // default : 현재 모듈안에서 내보내기할 객체가 한개일때 사용
    2. export {클래스(함수), 상수, 배열, ...};
*/
//export default Lifecycle;
export {Lifecycle};