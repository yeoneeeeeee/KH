/* 
    콜백함수 ?
    자바스크립트의 함수중 비동기적으로 작동하는 코드는 실행된 작업이 끝나지 않았더라도
    다음작업이 시작될 수 있는데, 이때 특정 코드를 "내가 원하는 시점"에 실행될 수 있도록
    컨트롤해줘야 할때 콜백함수를 사용한다.

    Promise
    콜백함수와 마찬가지로 비동기적으로 동작하는 코드를 "동기적으로" 구현할때 사용한다
    콜백함수와의 차이점은, 가독성이 높고, 예외처리가 가느하다.
*/
import {useEffect} from 'react';

function Callback(){

    useEffect( () => {
        logPrint(1 , function(return1){
            console.log("return1 : " + return1); // 2
            logPrint(return1 , (return2) => {
                console.log("return2 : " + return2); // 4
                logPrint(return2 , (return3) => {
                    console.log("retun3 : "+return3);
                    
                })
            })
        })
        function logPrint(param, callback){
            console.log("logPrint param :" + param); // 1, 3
            param += param;
            callback(param);
        }
    },[])
    return <h1>Callback Test</h1>
}

function PromiseThen(){
    
    useEffect( () => {
        /*
            Promise 내부에는 대기 , 이행, 거부의 개념이 있음
            대기상태에서 이행상태로 변할때 then()내부에 있는 함수가 실행된다.            

            reject? 대기, 이행, 거부중 거부상태가 됐을때 catch함수를 실행한다.
            작업도중 에러가 발생해 이행상태로 변환되지 못할경우를 대비한 예외처리구문을 작성
        */
       new Promise(
           (resolve, reject) => {
               // 첫번째 매개변수는 무조건 이행함수, 두번째 매개변수는 거부함수로써 사용하면된다.               
            setTimeout( () => {
                reject(Error("Error"));
                resolve('promise');
            } , 1500 );// 1.5초후에 setTimeout함수의 첫번째 매개변수로 전달받은
            // 콜백함수가 실행이 된다.
         } 
       ).then(
         (result) => {
            console.log(result); // 'promise'
            return result + ' then';// then함수내부에서 값이 반환되는 순간 다음 then실행된다.
         }
       ).then( 
          result => {
             console.log(result);// 'promise then'
          }
       ).catch( result => console.log("catch : "+result));
    },[])

    return <h1>Promise Then</h1>
}

export {Callback , PromiseThen};