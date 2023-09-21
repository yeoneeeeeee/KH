import {useEffect} from 'react';
/* 
    Fetch?
    자바스크립트 내장함수로, 비동기통신을 구현할때 사용
    * 비동기통신 -> 먼저 시작한 작업의 완료여부와 상관없이 다음 작업을 실행하는 것.

    fetch함수를 이용하여 get/post방식으로 url호출하여 데이터를 가져온다.
*/
function FetchGet(){
    useEffect(() => {

        const fetchData = async () => {
            /* 
                Get방식 요청시 별도의 추가메소드는 사용하지 않고,
                url뒤에 내가 전달하고자하는 값을 붙여서 전송함.
            */
            const response = await fetch("http://date.jsontest.com?a=1");
            //console.log(response.json());
            // json? response중 body에 있는 부분을 JSON형식으로 디코딩. => Javascript객체로변환

            /* 
                async ~ await을 붙인 이유?
                fetch함수,json함수 같은 경우 비동기적으로 작동하기 때문에 url을 호출하고
                데이터를 가져오기전에 response.json()메서드가 실행되면 에러가 발생할수 있다.
                (json함수는 JSON형태의 문자열 객체에서만 사용가능)

                따라서 데이터를 전부 다 가져온후에 아래 json함수가 호출되도록 흐름을 동기적으
                로 변환시켰다.
            */
            const body = await response.json();

            alert(body.date);
        };

        fetchData();
    });

    return <h1>fetch get test</h1>
}

function FetchPost(){
    
    useEffect(() => {
        
        const fetchData = async () => {

            const response = await fetch("http://date.jsontest.com",
                {
                    method : 'POST',
                    headers : {
                        'Content-Type' : 'application/json'
                        // json형태의 데이터를 사용하기 위한 설정.
                    },
                    body : JSON.stringify({
                        a : "test1",
                        b : "test2"
                    })
                });

                const body = await response.json();

                alert(body.time);
        }

        fetchData();
    },[])

    return(
        <h1>Fetch Post Test</h1>
    )
}

export {FetchGet , FetchPost};