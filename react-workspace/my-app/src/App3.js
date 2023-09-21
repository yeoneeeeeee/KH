import './App.css';

import {Pure , Shallow} from './05_PureComponent';

import { TestUseState , TestUseEffect, TestUseCallback} from './06_FunctionComponent';

import Fragements from './07_Fragments';

import Spread from './08_SpreadOperator';

function App3(){
    return(
        // <Pure/>
        //<Shallow/>
        // <div>
        //     <TestUseState/>
        //     <TestUseEffect/>
        //     <TestUseCallback/>
        // </div>
        // <table>
        //     <thead>
        //         <tr>
        //             <Fragements/>
        //         </tr>
        //     </thead>
        // </table>
        <Spread/>
    )
}
export default App3;