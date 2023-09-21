import { useNavigate, useLocation, useSearchParams } from "react-router-dom";
/* 
    [1] useNavigate : 함수형 컴포넌트에서 페이지이동을 쉽게 처리할수 있도록 도와주는 함수.
    Link와 비슷한 기능을하지만, 이동하고자하는 경로를 동적으로 조작할수 있다.

    [2] useLocation : location객체를 다룰수 있는 함수. 현재페이지의 url정보를 가져올때 사용

    [3] useSearchParam() : 쿼리스트링을 쉽게 조작하도록 도와주는 함수
*/
function ReactRouter3(){
    const navigate = useNavigate();

    const location = useLocation();
    // window.location과 같다. 리액트에서는 직접적인 locaion객체사용을 권장하지는 않음

    const [parameters , setSearchParams] = useSearchParams();
    // parameters ? 쿼리스트링에 들어간 key,value형태의 데이터가 저장된 "객체"
    // setSearchParams ? 쿼리스트링을 업데이트 시켜주는 함수.

    const paramvalue = parameters.get("name");

    const handleUpdateParam = () => {
        setSearchParams({name : paramvalue+"1234"});
    }

    const handleNavigate = () => {
        navigate('/route1');
        // Route에 지정해둔 경로에 맞는 컴포넌트가 랜더링된다.
    }

    return(
        <div>
            <h1>현재 path :: {location.pathname}</h1>
            <h1>넘겨받은 쿼리스트링 :: {location.search}</h1>
            <button onClick={handleUpdateParam}>파람값 변경하기</button> <br/>
            <button onClick={handleNavigate}>route1으로 이동</button>
        </div>
    )
}

export default ReactRouter3;