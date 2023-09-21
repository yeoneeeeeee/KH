
import { useDispatch, useSelector } from 'react-redux';
import {Button} from 'reactstrap';
import { increment, decrement } from '../redux/counterSlice';

export default function Counter(){
    const count = useSelector( (state) => state.counter.value );

    const dispatch = useDispatch();

    return(
        <div>
            <div style={{display:"flex",justifyContent:"center"}}>
                <Button color="warning" onClick={() => { dispatch(decrement())   }}>-</Button>
                <div style={{width:"100%"}}>{count}</div>
                <Button color="primary" onClick={() => { dispatch(increment())}}>+</Button>
            </div>
        </div>
    )
}