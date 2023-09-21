import {useContext} from 'react';
import {MyContext} from './09_Context';

function Children3(){
    const contextValue = useContext(MyContext);
    
    const handleClick = () => {
        contextValue.setStateFunc("자식 컴포넌트에서 부모 컴포넌트요소를 변경!")
    }

    return(
        <button onClick={handleClick}>
            contextValue.name :: {contextValue.name}
        </button>
    )
}
export default Children3;