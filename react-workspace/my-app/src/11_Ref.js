/* 
    Ref ? reference의 약자. 참조변수

    자바스크립트에서 html요소를 선택할때
    document.getElementById('아이디값')와 같은 선택함수와 같이 요소를 가져온후 조작하였음.

    React에서는 위 방식에 더해서 Ref를 통해 html요소를 조작할수 있도록 지원한다.
*/
import {useRef} from 'react';

import withLogging from './withLogging';

function ReactRef(){

    const inputRef = useRef(null); //Ref변수 생성

    const refFocus = () => {
        console.log(inputRef , inputRef.current);

        // 현재 참조하고있는 요소에 대한 정보가 current에 할당되어있다
        inputRef.current.focus();
    }

    // 자바스크립트방식 요소 선택
    const javascriptFocus = () => {
        document.getElementById("id1").focus();
    }

    return(
        <>  
            {/* 
                input요소에 ref속성을 추가하고 inputRef변수에 할당시,
                현재 input요소에 대한 정보를 inputRef를 통해 참조할수 있다.
            */}
            <input id="id1" type='text' ref={inputRef}/>

            <input type="button" value="REF" onClick={refFocus}/>

            <input type="button" value="Javascript Focus" onClick={javascriptFocus}/>
        </>
    )
}

export default withLogging(ReactRef, 'ReactRef');