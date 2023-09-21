import axios from 'axios';

import { useEffect } from 'react';

function AxiosGet(){
    useEffect(()=>{
        axios.get("http://date.jsontest.com?a=1&b=2")
             .then( (response) => {
                alert("Axios Get : "+ response.data.date);
            });
        /* 
            get() : get방식으로 http호출. url호출이 완료되면 then()함수가 실행됨.
            then() : 호출결과로 response데이터가 반환되며, response와 변수명 사이에
            data를 붙이면 변수에 접근해서 사용할수 있다.
        */
    },[]);

    return <h1>Axios Get Test</h1>
}

function AxiosPost(){
    useEffect( () => {
        axios.post("http://date.jsontest.com/",{a:1, b:2})
             .then( (response) => {
                alert("Axios Post "+ response.data.date);
             })
    },[])

    return <h1>Axios Post Test</h1>
}


export {AxiosGet , AxiosPost}