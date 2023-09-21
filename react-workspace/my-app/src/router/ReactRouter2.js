import {Link} from 'react-router-dom';

function ReactRouter2 () {
    return(
        <>
            <h1>path="/route1"</h1>
            <h1>서브페이지1</h1>
            <Link to={"/"}>메인으로</Link>
        </>
    )
}
export default ReactRouter2