/* 
    createSlice? 
    리듀서 + 액션 생성
    리덕스에서 제공하는 함수로 리듀서와 action을 함께 생성해줄수 있다.
*/

import { createSlice } from "@reduxjs/toolkit";
/* 
    createSlice? 반복적인 액션 생성작업을 줄여서 생산성을 향상시키기위해
    만들어진 함수

    [표현법]
    const 변수명 = createSlice({
        name : '리듀서의 이름',
        initialState : 초기화할 값
        reducers : {
            액션1 : () => {
                //상태변경로직
            },
            액션2 : ()=> {
                //상태변경로직
            }
        }
    });
*/
const counterSlice = createSlice({
    name : 'counter',
    initialState : {
        value : 0
    },
    reducers : {
        increment : (state) => {
            state.value += 1;
        },
        decrement : (state) => {
            state.value -= 1;
        }
    }
});
export const {increment, decrement} = counterSlice.actions;

export default counterSlice.reducer;