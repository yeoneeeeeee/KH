import {Link} from 'react-router-dom';

function ReactRouter(){
    return(
        <>
            <h1>path="/"</h1>
            <h3>메인페이지</h3>
            <Link to={'./route1'}>route1으로 이동하기</Link> <br/>
            <Link to={'./route2'}>route2으로 이동하기</Link>
        </>
    )
}
export default ReactRouter;