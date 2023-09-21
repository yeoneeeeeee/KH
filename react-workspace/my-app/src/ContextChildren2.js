import {useContext} from 'react';// 부모컴포넌트의 데이터를 사용하기위해 필요한 함수
import { MyContext } from './09_Context';
import Children3 from './ContextChildren3';

function Children2(){
    const contextValue = useContext(MyContext);
    //return <h3>{`contextValue : ${JSON.stringify(contextValue)}`}</h3>
    return <Children3/>
}
export default Children2;