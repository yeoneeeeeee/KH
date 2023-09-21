/*
    Context?
    기존에 props를 이용하여 부모컴포넌트에서 자식컴포넌트로 데이터를 전달할 수 잇었음.

    단, 해당 데이터를 자식컴포넌트가 아니라 후손 컴포넌트에서만 필요로 하는 데이터라면 자식컴포넌트에서는
    불필요하게 코드를 작성해줘야하는데, 이때 Context를 사용하면 데이터 공급자와, 소비자를 정의하여 데이터가
    필요한 컴포넌트만 사용할수 있게 구현할수 있다. 

    컨텍스트를 사용하면 하위컴포넌트가 여러개인 구조에서 유용하게 사용할수 있음. 
    먼 후손 컴포넌트도 소비자를 임포트해서 필요한 데이터를 쓸수 있다.

    props VS Context
    props는 부모컴포넌트에서 직계자식컴포넌트에게만 전달되는 데이터라면,
    Context는 모든 컴포넌트에 전반적으로 영향을 끼칠수 있다.
*/

import {useState, createContext} from 'react';
import Children from './ContextChildren1';

const MyContext = createContext();

function ContextApi(){

    const [name, setName] = useState('');

    const setStateFunc = (value) => {
        setName(value);
    }

    const content = {
        name,
        setStateFunc
    }
    /* 
        자식에게 넘겨줄 데이터에 상태값(name)과 상태값을 변경해줄수있는 함수를 넘겨줌.
    */

    return (
        // 자식태그(Children)를 Provider로 감싸고 전달한 데이터는, value값으로 할당.
        <MyContext.Provider value={content}>
            <Children/>
        </MyContext.Provider>
    )
}

export {ContextApi , MyContext};
