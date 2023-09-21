import {Component} from 'react';
/* 
    state ? 컴포넌트 내부에서 전역변수로 활용하기 위해 사용되는 속성.
    state안에는 변수의 유효범위와 무관하게 계속 유지되어야하는 전역변수값을
    설정한다.

    리액트 이벤트 부여방식. JSX함수로 태그에 인라인방식으로 on+이벤트명
    부여가능.
*/
/* 부모컴포넌트로부터 전달받은 props를 전역변수에 저장 후, 버튼 클릭시
   state에 담긴 값을 변경해주면서 화면에 출력해보는 기능을 추가.
*/
class StateAndEvent extends Component{

    constructor(props){
        super(props);
        this.state = {
            StateString: '클릭전' , 
            flag : true
        }
    }
    StateChange = () => {
        if(this.state.flag){
            this.setState({StateString : "클릭됨" , flag : !this.state.flag })
        }else{
            this.setState({StateString : "클릭전" , flag : !this.state.flag})
        }
        /* 
            setState()메서드 
            state의 상태도 변경시키면서 화면에 변경된 값을 불러오는 메서드.
            setState사용시 컴포넌트의 State값이 변경됐다고 간주하여서 
            render매서드를 자동으로 호출함.
        */

        // if(this.state.flag == true){
        //     this.state.StateString = "클릭됨";
        // }
        // console.log(this.state.StateString);
        // this.forceUpdate();// 화면 강제새로고침.
    }   

    render(){
        console.log("render 호출");
        return (
            <div style={{padding:"0px"}}>
                <button onClick={this.StateChange}>클릭</button>
                현재 state :: StateString : {this.state.StateString}
            </div>
        )
    }

}

export default StateAndEvent;