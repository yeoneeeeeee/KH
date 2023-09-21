/*
    함수형 컴포넌트.
    return값이 있는 function과 동일한 구조의 컴포넌트.
    부모컴포넌트에게서 props로 파라미터를 전달받아 사용할수는 있음.
    render함수가 없기때문에 return만 사용하여 화면을 그려줌.

    state가 없고, 생명주기 함수를 사용할수가 없음.

    함수형 컴포넌트에서 state와 생명주기 함수으 기능을 사용해야하는 경우 비슷한
    기능을 제공하는 hook을 추가하면 된다.

    대표적인 hook함수
    [1] useState() : state변수값을 선언하게 해주는 메소드. (setState메서드와 비슷한 역할)

    [2] useEffect(콜백함수) : 생명주기함수중 componentDidMount와 비슷한 역할을함

    [3] useCallback(콜백함수) : 매개변수로 들어간 콜백함수를 캐시에 저장하여 빠르게
    해당 함수를 실행할수있게 도와준다(성능최적화에 사용)

    캐시? 데이터나 값을 미리 저장하는 저장소. 빠르게 저장된 값을 가져오고자할때 사용.
    리액트 훅에서는 전연벽수를 캐시에 저장하여 상태값을 가질수 있게끔 컨트롤함.
*/
import {useState, useEffect, useCallback} from 'react';

function TestUseState(){
    /*
        [1] useState() : state변수값을 선언하게 해주는 메소드

        [표현법]
        const [값을 담을 변수 , 값을 변경하는 setter함수] = useState(초기값);

        useState메서드는 길이 2짜리 배열을 반환해주며, 이를 구조분해할당을 이용하여
        반환된 값을 저장

        반환된 값을 담아줄 첫번째인자(count) : state의 변수명 
        반환된 값을 담아줄 두번째인자(setCount) : count값을 변경해주는 함수를 저장
                                                (setState와 비슷한 역할)
    */
    //    const list = useState(0);
    //    const count =list[0];
    //    const setCount = list[1];

   const [count, setCount] = useState(0);
   // count 변수에 초기값으로 0으로 설정 -> this.state = {count : 0 }
   // setCount함수는 state값중 count를 변경해주는 함수를 저장 -> this.setState({count : x})


   //count값을 증가시키는 메서드
   //const increment = () => setCount(count +1);

   function increment(){
        return setCount(count+1);
   }

   return (
        <div>
            <button onClick={increment}>증가</button>
            count :: {count}
        </div>
   )
}   

function TestUseEffect(){
    /* 
        [2] useEffect() : 생명주기함수중 componentDidMount와 동일한 역할을 함.
        최초 페이지 로딩시 한번은 무조건 실행되고, "의존성 목록"이 바뀔때마다 다시한번 실행된다.

        [표현법]
        useEffect(    
            () => {
                // 랜더링이 완료된 후 실행할 코드.
                return 컴포넌트가 언마운트 될때 실행할 코드 (componentWilUnMount와 동일한 역할)
            }, [의존성 목록]
        )
        useEffect의 반환값으로 다시한번 콜백함수를 반환하게 되면 컴포넌트가 소멸할때 해당 함수를 실행
        시킨다(componentWillUnMount)
    */
    
    const [count, setCount] = useState(0);

    const increment = () => setCount(count+1);

    useEffect(
        () => {
            // 페이지 랜더링이 완료된후, id값이 btn1인 요소를 찾아서 이벤트 부여
            const btn1 = document.getElementById("btn1");
            if(btn1){
                btn1.addEventListener('click',increment);
                return () => btn1.removeEventListener('click',increment);
                // 컴포넌트가 소멸할때 추가한 이벤트 제거.
            }
        },[count]
    );
    /* 
        * 의존성? 캐시를 갱신시킬 요소. 리액트에서는 의존성 목록중 어느것 하나라도 충족되면(값이변경)
        캐시된 값을 자동으로 갱신하고 컴포넌트를 다시 랜더링하여 변경사항을 반영함.
        보통 useState로 선언한 state상태값을 넣어줘서  state값의 변경이 있을때 캐시를 갱신시키고, 페이지를
        재 랜더링 시킴.
    */

    return (
        <div>
            <button id='btn1'>increment</button>
            count :: {count}
        </div>
    )
}

function TestUseCallback(){
    /*
        [3] useCallback(원본 콜백 함수, 의존성 목록) : 프로그램 성능 최적화작업세 사용되며,
                                                     함수의 몸통(실행할코드)를 캐싱하는데 사용한다.
    */

    const [count, setCount] = useState(0);

    const increment = useCallback(
        () => {
            setCount(count+1)
        }, [count]
    );

    return(
        <div>
            <button onClick={increment}>증가</button>
            count :: {count}
        </div>
    )
}


export {TestUseState , TestUseEffect, TestUseCallback};









